//
//  UIView+Styles.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 2.11.23.
//

import UIKit

extension UIView {
    
    static func roundedViewWithShadow() -> UIView {
        let view = UIView()
        
        view.backgroundColor = .white
        view.cornerRadius = 5.0
        view.shadowColor = .appShadowBlack
        view.shadowOpacity = 0.05
        view.shadowOffset = CGSize(width: 2.0, height: 4.0)
        
        return view
    }
    
    static func contentView() -> UIView {
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }
}
