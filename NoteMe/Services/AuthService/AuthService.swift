//
//  AuthService.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 5.12.23.
//

import Foundation
import FirebaseAuth

final class AuthService {
    
    private var firebase: Auth {
        return Auth.auth()
    }
    
    func signIn(email: String,
                password: String,
                completion: @escaping (Bool) -> Void) {
        firebase.signIn(withEmail: email, password: password) { result, error in
            completion(error == nil)
        }
    }
    
    func signUp(email: String,
                password: String,
                completion: @escaping (Bool) -> Void) {
        firebase.createUser(withEmail: email, password: password) { result, error in
            completion(error == nil)
        }
    }
    
    func resetEmail(email: String,
                    completion: @escaping (Bool) -> Void) {
        firebase.sendPasswordReset(withEmail: email) { error in
            completion(error == nil)
        }
    }
    
    func getCurrentUserName() -> String? {
        firebase.currentUser?.email
    }
    
    func logout(completion: @escaping ((Result<Void, Error>) -> Void)) {
        do {
            try firebase.signOut()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
    
}


