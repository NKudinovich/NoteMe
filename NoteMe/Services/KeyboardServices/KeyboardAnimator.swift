//
//  KeyboardAnimate.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 13.12.23.
//

import UIKit
import SnapKit

final class KeyboardAnimator {
    
    func moveView(for targetView: UIView,
                  frame: CGRect,
                  padding: CGFloat) {
        let maxY = targetView.frame.maxY + padding
        let keyboardMinY = frame.minY
        let diff = maxY - keyboardMinY
        
        if diff > 0 {
            update(for: targetView, with: -diff)
        } else {
            update(for: targetView, with: .zero)
        }
    }
    
    private func update(for targetView: UIView,
                        with offset: CGFloat) {
        targetView.snp.updateConstraints { make in
            make.centerY.equalToSuperview().offset(offset)
        }
        targetView.superview?.layoutIfNeeded()
    }
    
}
