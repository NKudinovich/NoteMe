//
//  LoginVM.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 10.11.23.
//

import UIKit
import FirebaseAuth

protocol LoginCoordinatorProtocol: AnyObject {
    func finish()
    func openRegisterModule()
    func openResetModule()
}

protocol LoginInputValidatorUseCase {
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol LoginKeyboardHelperUseCase {
    @discardableResult
    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
      
    @discardableResult
    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
}

protocol LoginAuthServiceUseCase {
    func login(email: String,
               password: String,
               completion: @escaping (Bool) -> Void)
}

protocol LoginAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
}

final class LoginVM: LoginViewModelProtocol {
    var keyboardChangedFrame: ((CGRect) -> Void)?
    
    var catchEmailError: ((String?) -> Void)?
    var catchPasswordError: ((String?) -> Void)?
    
    //Keys with localization
    private enum L10n {
        static let wrongEmailError: String = "loginVC_wrong_email".localizable
    }
    
    private weak var coordinator: LoginCoordinatorProtocol?
    
    private let authService: LoginAuthServiceUseCase
    private let inputValidator: LoginInputValidatorUseCase
    private let alertService: LoginAlertServiceUseCase
    private let keyboardHelper: LoginKeyboardHelperUseCase
    
    init(coordinator: LoginCoordinatorProtocol,
         authService: LoginAuthServiceUseCase,
         inputValidator: LoginInputValidatorUseCase,
         alertService: LoginAlertServiceUseCase,
         keyboardHelper: LoginKeyboardHelperUseCase) {
        self.coordinator = coordinator
        self.authService = authService
        self.inputValidator = inputValidator
        self.alertService = alertService
        self.keyboardHelper = keyboardHelper
        
        bind()
    }
    
    func bind() {
        keyboardHelper
            .onWillShow { [weak self] in
                self?.keyboardChangedFrame?($0)
            }.onWillHide { [weak self] in
                self?.keyboardChangedFrame?($0)
            }
    }
    
    func loginDidTap(email: String?, password: String?) {
        guard
            checkValidation(email: email),
            let email, let password
        else { return }
        
        authService.login(email: email, password: password) { [weak self]
         isSuccess in
            print(isSuccess)
            if isSuccess {
                ParametersHelper.set(.authenticated, value: true)
                self?.coordinator?.finish()
            } else {
                self?.alertService.showAlert(title: "title",
                                            message: "message",
                                            okTitle: "okay, boss")
            }
        }
    }
    
    func newAccountDidTap() {
        print("\(#function)")
        coordinator?.openRegisterModule()
    }
    
    func forgotPasswordDidTap(email: String?) {
        print("\(#function)")
        coordinator?.openResetModule()
    }
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        catchEmailError?(isEmailValid ? nil : L10n.wrongEmailError)
        
        return isEmailValid
    }
}
