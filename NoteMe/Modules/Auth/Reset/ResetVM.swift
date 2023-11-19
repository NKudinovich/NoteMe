//
//  ResetVM.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 19.11.23.
//

import UIKit

protocol ResetInputValidatorUseCase {
    func validate(email: String?) -> Bool
}

protocol ResetAuthServiceUseCase {
    func reset(email: String,
               completion: @escaping (Bool) -> Void)
}

final class ResetVM: ResetViewModelProtocol {
    var catchEmailError: ((String?) -> Void)?
    
    private let inputValidator: ResetInputValidatorUseCase
    private let authService: ResetAuthServiceUseCase
    
    init(inputValidator: ResetInputValidatorUseCase,
         authService: ResetAuthServiceUseCase) {
        self.inputValidator = inputValidator
        self.authService = authService
    }
    
    func resetDidTap(email: String?) {
        guard
            checkValidation(email: email),
            let email
        else { return }
        authService.reset(email: email) { isSucces in
            print(isSucces)
        }
    }
    
    func cancelDidTap() {
    }
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        catchEmailError?(isEmailValid ? nil : "Wrong e-mail")
        
        return isEmailValid
    }
}
