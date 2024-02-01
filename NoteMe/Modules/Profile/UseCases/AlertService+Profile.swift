//
//  AlertService+Profile.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 1.02.24.
//

import UIKit

extension AlertService: ProfileAlertServiceUseCase {
    
    func showAlert(title: String?,
                   message: String?,
                   cancelTitle: String?,
                   cancelStyle: UIAlertAction.Style?,
                   okTitle: String?,
                   okHandler: (() -> Void)?,
                   okStyle: UIAlertAction.Style?) {
        self.showAlert(title: title,
                       message: message,
                       cancelTitle: cancelTitle,
                       cancelStyle: cancelStyle,
                       okTitle: okTitle,
                       okHandler: okHandler,
                       okStyle: okStyle)
    }
    
}
