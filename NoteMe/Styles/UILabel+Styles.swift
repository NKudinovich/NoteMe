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
        label.numberOfLines = .zero
        
        return label
    }
    
    static func listOnboardLabel(_ text: String) -> UILabel {
        let label = UILabel()
        
        label.font = .appFont.withSize(16.0)
        label.textColor = .appText
        label.text = text
        
        return label
    }
    
    static func textWithHTML(_ text: String) -> UILabel {
        let label = UILabel()
        label.attributedText = .parse(html: text,
                                      font: .appFont.withSize(13.0))
        label.numberOfLines = .zero
        
        return label
    }
}
