//
//  String+Locale.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 3.11.23.
//

import UIKit

extension String {
    var localizable: String {
        return NSLocalizedString(self, comment: "")
    }
}
