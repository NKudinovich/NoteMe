//
//  AuthService+Register.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 7.12.23.
//

import Foundation

extension AuthService: RegisterAuthUseCase {
    func register(email: String,
                  password: String,
                  completion: @escaping (Bool) -> Void) {
        self.signUp(email: email, password: password, completion: completion)
    }
}
