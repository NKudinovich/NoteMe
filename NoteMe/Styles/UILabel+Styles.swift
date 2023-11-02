//
//  UILabel+Styles.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 1.11.23.
//

import UIKit

extension UILabel {
    
    static func mainTitleLabel(_ title: String) -> UILabel {
        let label = UILabel()
        
        label.font = .appBoldFont.withSize(25.0)
        label.textColor = .appText
        label.text = title
        
        return label
    }
    
}
