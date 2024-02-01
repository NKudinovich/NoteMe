//
//  View+Layer.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 31.10.23.
//

import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    var shadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    var shadowOpacity: CGFloat {
        get { CGFloat(layer.shadowOpacity) }
        set { layer.shadowOpacity = Float(newValue) }
    }
    
    var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    var shadowColor: UIColor? {
        get {
            guard
                let cgColor = layer.shadowColor
            else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.appShadowBlack.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}
