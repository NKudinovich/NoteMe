//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 14.11.23.
//

import UIKit

final class RegisterAssembler {
    private init() {}
    
    static func make(coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: KeyboardHelper(),
                                          inputValidator: InputValidator(),
                                          authService: TESTAuthService())
        let vc = RegisterVC(presenter: presenter)
        
        presenter.delegate = vc
        
        return vc
    }
}

private class TESTAuthService: RegisterAuthUseCase {
    func register(email: String,
                  password: String,
                  completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    
}
