//
//  ProfileAccountCell.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 23.01.24.
//

import UIKit
import SnapKit

final class ProfileAccountCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appRed
        label.font = .appFont.withSize(17)
        label.text = "Your email"
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont.withSize(17)
        label.textColor = .appText
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(email: String) {
        emailLabel.text = email
    }
    
    private func setupConstraints() {
        addSubview(titleLabel)
        addSubview(emailLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).inset(-4)
        }
    }
    
    
}
