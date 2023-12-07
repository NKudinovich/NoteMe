//
//  AuthService+Reset.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 7.12.23.
//

import Foundation

extension AuthService: ResetAuthServiceUseCase {
    func reset(email: String, completion: @escaping (Bool) -> Void) {
        self.resetEmail(email: email, completion: completion)
    }
}
