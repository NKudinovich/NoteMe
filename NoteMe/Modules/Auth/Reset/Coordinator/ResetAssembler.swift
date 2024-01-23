//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 19.11.23.
//

import UIKit

final class ResetAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: ResetCoordinatorProtocol) -> UIViewController {
        let inputValidator: InputValidator = container.resolve()
        let authService: AuthService = container.resolve()
        let alertService: AlertService = container.resolve()
        let keyboardHelper: KeyboardHelper = container.resolve()
        let keyboardAnimator: KeyboardAnimator = container.resolve()
        
        
        let vm = ResetVM(coordinator: coordinator,
                         inputValidator: inputValidator,
                         authService: authService,
                         alertService: alertService,
                         keyboardHelper: keyboardHelper)
        
        return ResetVC(viewModel: vm, keyboardAnimator: keyboardAnimator)
    }
}
