//
//  ProfileTableViewHeader.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 23.01.24.
//

import UIKit
import SnapKit

final class ProfileTableViewHeader: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .appBoldFont.withSize(14)
        return label
    }()
    
    var text: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
    }
}
