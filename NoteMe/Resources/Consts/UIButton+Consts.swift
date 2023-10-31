//
//  UIButton+Consts.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 31.10.23.
//

import UIKit

extension UIButton {
    
    func buttonMainStyle(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.appBlack, for: .normal)
        self.titleLabel?.font = .appBoldFont
        self.backgroundColor = .appYellow
        self.layer.cornerRadius = 5.0
    }
    
    func buttonUnderlineStyle(title: String, color: UIColor) {
        let text = title
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ],
        range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = .appBoldFont
    }
}
