//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 14.11.23.
//

import UIKit

protocol RegisterPresenterDelegate: AnyObject {
    func setEmailError(error: String?)
    func setPasswordError(error: String?)
    func setRepeatPasswordError(error: String?)
    
    func keyboardFrameChanged(_ frame: CGRect)
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

final class RegisterPresenter: RegisterPresenterProtocol {
    
    weak var delegate: RegisterPresenterDelegate?
    
    private let keyboardHelper: KeyboardHelper
    private let inputValidator: RegisterInputValidatorUseCase
    private let authService: RegisterAuthUseCase
    
    init(keyboardHelper: KeyboardHelper,
         inputValidator: RegisterInputValidatorUseCase,
         authService: RegisterAuthUseCase) {
        self.keyboardHelper = keyboardHelper
        self.inputValidator = inputValidator
        self.authService = authService
        
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
        authService.register(email: email, password: password) { isSucces in
            print(isSucces)
        }
    }
    
    func haveAccountDidTap() {
    }
    
    private func checkValidation(email: String?, password: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        delegate?.setEmailError(error: isEmailValid ? nil : "Wrong e-mail")
        delegate?.setPasswordError(error: isPasswordValid ? nil : "Wrong password")
        
        return isEmailValid && isPasswordValid
    }
    
    private func twoPasswordIdentical(password: String?,
                                      repeatPassword: String?) -> Bool {
            let password = password
            let repeatPassword = repeatPassword
        delegate?.setRepeatPasswordError(error: password == repeatPassword ?
                                         nil : "Passwords are not the same")
        return password == repeatPassword
    }
}
