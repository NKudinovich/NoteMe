//
//  ResetVM.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 19.11.23.
//

import UIKit

protocol ResetCoordinatorProtocol: AnyObject {
    func finish()
    func showAlert(_ alert: UIAlertController)
}

protocol ResetInputValidatorUseCase {
    func validate(email: String?) -> Bool
}

protocol ResetAuthServiceUseCase {
    func reset(email: String,
               completion: @escaping (Bool) -> Void)
}

protocol ResetAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
}

protocol ResetKeyboardHelperUseCase {
    @discardableResult
    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
      
    @discardableResult
    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
}

final class ResetVM: ResetViewModelProtocol {
    var catchEmailError: ((String?) -> Void)?
    var keyboardFrameChanged: ((CGRect) -> Void)?
    
    //Keys with localization
    private enum L10n {
        static let wrongEmail: String = "resetVC_wrong_email".localizable
    }
    
    private let inputValidator: ResetInputValidatorUseCase
    private let authService: ResetAuthServiceUseCase
    private let alertService: ResetAlertServiceUseCase
    private let keyboardHelper: ResetKeyboardHelperUseCase
    
    private weak var coordinator: ResetCoordinatorProtocol?
    
    init(coordinator: ResetCoordinatorProtocol,
         inputValidator: ResetInputValidatorUseCase,
         authService: ResetAuthServiceUseCase,
         alertService: ResetAlertServiceUseCase,
         keyboardHelper: ResetKeyboardHelperUseCase) {
        self.coordinator = coordinator
        self.inputValidator = inputValidator
        self.authService = authService
        self.alertService = alertService
        self.keyboardHelper = keyboardHelper
    }
    
    func bind() {
        keyboardHelper
            .onWillShow { [weak self] in
                self?.keyboardFrameChanged?($0)
            }.onWillHide { [weak self] in
                self?.keyboardFrameChanged?($0)
            }
    }
    
    func resetDidTap(email: String?) {
        guard
            checkValidation(email: email),
            let email
        else { return }
        authService.reset(email: email) { [weak coordinator] isSucces in
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
    
    func cancelDidTap() {
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        catchEmailError?(isEmailValid ? nil : L10n.wrongEmail)
        
        return isEmailValid
    }
}
