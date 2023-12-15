//
//  LoginAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 10.11.23.
//

import UIKit

final class LoginAssembler {
    private init() {}
    
    static func make(coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let vm = LoginVM(coordinator: coordinator,
                         authService: AuthService(),
                         inputValidator: InputValidator(),
                         alertService: AlertService.current,
                         keyboardHelper: KeyboardHelper())
        
        return LoginVC(viewModel: vm, keyboardAnimator: KeyboardAnimator())
    }
}
