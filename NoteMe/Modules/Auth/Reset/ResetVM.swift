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

final class ResetVM: ResetViewModelProtocol {
    var catchEmailError: ((String?) -> Void)?
    
    private let inputValidator: ResetInputValidatorUseCase
    private let authService: ResetAuthServiceUseCase
    
    private weak var coordinator: ResetCoordinatorProtocol?
    
    init(coordinator: ResetCoordinatorProtocol,
         inputValidator: ResetInputValidatorUseCase,
         authService: ResetAuthServiceUseCase) {
        self.coordinator = coordinator
        self.inputValidator = inputValidator
        self.authService = authService
    }
    
    func resetDidTap(email: String?) {
        guard
            checkValidation(email: email),
            let email
        else { return }
        authService.reset(email: email) { [weak coordinator] isSucces in
            print(isSucces)
            if isSucces {
                print("reset done")
                coordinator?.finish()
            } else {
                let alertVC = AlertBuilder.build(title: "Error",
                                                 message: "Some error",
                                                 okTitle: "Ok")
                coordinator?.showAlert(alertVC)
            }
        }
    }
    
    func cancelDidTap() {
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        catchEmailError?(isEmailValid ? nil : "resetVC_wrong_email".localizable)
        
        return isEmailValid
    }
}
