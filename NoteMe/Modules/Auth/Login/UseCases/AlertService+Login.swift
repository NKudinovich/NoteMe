//
//  AlertService+Login.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 12.12.23.
//

import UIKit

extension AlertService: LoginAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String) {
        showAlert(title: title, message: message, okTitle: okTitle, okHandler: nil)
    }
}
