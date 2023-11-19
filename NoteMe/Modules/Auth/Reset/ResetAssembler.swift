//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 19.11.23.
//

import UIKit

final class ResetAssembler {
    private init() {}
    
    static func make() -> UIViewController {
        let vm = ResetVM(inputValidator: InputValidator(),
                         authService: TESTAuthService())
        
        return ResetVC(viewModel: vm)
    }
}

private class TESTAuthService: ResetAuthServiceUseCase {
    func reset(email: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}
