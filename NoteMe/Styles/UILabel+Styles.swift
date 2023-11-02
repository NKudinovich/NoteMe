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
    
    static func infoViewText(_ text: String) -> UILabel {
        let label = UILabel()
        
        label.font = .appFont.withSize(13.0)
        label.textColor = .appText
        label.text = text
        label.numberOfLines = 0
        
        return label
    }
    
}
