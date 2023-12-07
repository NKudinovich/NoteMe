//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 19.11.23.
//

import UIKit

final class ResetAssembler {
    private init() {}
    
    static func make(coordinator: ResetCoordinatorProtocol) -> UIViewController {
        let vm = ResetVM(coordinator: coordinator,
                         inputValidator: InputValidator(),
                         authService: AuthService())
        
        return ResetVC(viewModel: vm)
    }
}
