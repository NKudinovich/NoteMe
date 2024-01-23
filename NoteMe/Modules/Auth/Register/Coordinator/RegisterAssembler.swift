//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 14.11.23.
//

import UIKit

final class RegisterAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        let keyboardHelper: KeyboardHelper = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        let authService: AuthService = container.resolve()
        let alertService: AlertService = container.resolve()
        
        
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: keyboardHelper,
                                          inputValidator: inputValidator,
                                          authService: authService,
                                          alertService: alertService)
        let vc = RegisterVC(presenter: presenter)
        
        presenter.delegate = vc
        
        return vc
    }
}
