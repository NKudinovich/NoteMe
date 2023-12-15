//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 14.11.23.
//

import UIKit

protocol RegisterCoordinatorProtocol: AnyObject {
    func finish()
    func showAlert(_ alert: UIAlertController)
}

protocol RegisterPresenterDelegate: AnyObject {
    func setEmailError(error: String?)
    func setPasswordError(error: String?)
    func setRepeatPasswordError(error: String?)
    
    func keyboardFrameChanged(_ frame: CGRect)
}

protocol RegisterKeyboardHelperUseCase {
    @discardableResult
    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
      
    @discardableResult
    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
}

protocol RegisterInputValidatorUseCase {
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol RegisterAuthUseCase {
    func register(email: String,
                  password: String,
                  completion: @escaping (Bool) -> Void)
}

protocol RegisterAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
}

final class RegisterPresenter: RegisterPresenterProtocol {
    
    //Keys with localization
    private enum L10n {
        static let wrongEmail: String = "registerVC_wrong_email".localizable
        static let nonValidPassword: String = "registerVC_nonvalid_password".localizable
        static let mismatchPasswords: String = "registerVC_password_mismatch".localizable
    }
    
    weak var delegate: RegisterPresenterDelegate?
    
    private weak var coordinator: RegisterCoordinatorProtocol?
    
    private let keyboardHelper: RegisterKeyboardHelperUseCase
    private let inputValidator: RegisterInputValidatorUseCase
    private let authService: RegisterAuthUseCase
    private let alertService: RegisterAlertServiceUseCase
    
    init(coordinator: RegisterCoordinatorProtocol,
         keyboardHelper: RegisterKeyboardHelperUseCase,
         inputValidator: RegisterInputValidatorUseCase,
         authService: RegisterAuthUseCase,
         alertService: RegisterAlertServiceUseCase) {
        self.coordinator = coordinator
        self.keyboardHelper = keyboardHelper
        self.inputValidator = inputValidator
        self.authService = authService
        self.alertService = alertService
        
        bind()
    }
    
    private func bind() {
        keyboardHelper.onWillShow { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
        }.onWillHide { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
        }
    }
    
    func registerDidTap(email: String?,
                        password: String?,
                        repeatPassword: String?) {
        guard
            checkValidation(email: email, password: password),
            twoPasswordIdentical(password: password, repeatPassword: repeatPassword),
            let email, let password
        else { return }
        authService.register(email: email, password: password) { [weak coordinator]
            isSucces in
            print(isSucces)
            if isSucces {
                coordinator?.finish()
            } else {
                self.alertService.showAlert(title: "Error",
                                       message: "Some error",
                                       okTitle: "ok")
            }
        }
    }
    
    func haveAccountDidTap() {
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?, password: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        delegate?.setEmailError(error: isEmailValid ?
                                nil : L10n.wrongEmail)
        delegate?.setPasswordError(error: isPasswordValid ?
                                nil : L10n.nonValidPassword)
        
        return isEmailValid && isPasswordValid
    }
    
    private func twoPasswordIdentical(password: String?,
                                      repeatPassword: String?) -> Bool {
            let password = password
            let repeatPassword = repeatPassword
        delegate?.setRepeatPasswordError(error: password == repeatPassword ?
                                         nil : L10n.mismatchPasswords)
        return password == repeatPassword
    }
}
