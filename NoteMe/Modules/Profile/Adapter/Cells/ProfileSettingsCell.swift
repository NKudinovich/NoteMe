//
//  ProfileSettingsCell.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 23.01.24.
//

import UIKit
import SnapKit

final class ProfileSettingsCell: UITableViewCell {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont.withSize(14)
        label.textColor = .appText
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
       let label = UILabel()
        label.font = .appFont.withSize(12)
        label.textColor = .appRed
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(statusLabel)
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(16)
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).inset(-8)
            make.verticalEdges.equalToSuperview().inset(12)
        }
    }
    
    func setup(_ type: ProfileSettingsRows) {
        titleLabel.text = type.title
        titleLabel.textColor = type == .logout ? .appRed : .appText
        iconImageView.image = type.icon
        statusLabel.text = type.infoText
    }
    
}
