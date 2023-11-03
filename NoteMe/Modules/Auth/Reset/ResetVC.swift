//
//  ResetVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 2.11.23.
//

import UIKit
import SnapKit

final class ResetVC: UIViewController {
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var resetPasswordTitle: UILabel = .mainTitleLabel("reset_title".localizable)
    
    private lazy var infoView: UIView = .roundedViewWithShadow()
    
    private lazy var infoViewText: UILabel =
        .infoViewText("reset_info_text".localizable)
    
    private lazy var resetPasswordTextField: LineTextField = {
        let textField = LineTextField()
        textField.placeholder = "enter_email".localizable
        return textField
    }()
    
    private lazy var resetButton: UIButton = .yellowRoundedButton("reset_btn".localizable)
    private lazy var cancelButton: UIButton = .appCancelButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(infoView)
        contentView.addSubview(resetPasswordTitle)
        contentView.addSubview(cancelButton)
        contentView.addSubview(resetButton)
        
        infoView.addSubview(infoViewText)
        infoView.addSubview(resetPasswordTextField)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(resetButton.snp.centerY)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(72.0)
            make.size.equalTo(96.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
        }
        
        infoViewText.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        resetPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(infoViewText.snp.bottom).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(20.0)
        }
        
        resetPasswordTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(-8.0)
            make.height.equalTo(45.0)
        }
        
        resetButton.snp.makeConstraints { make in
            make.bottom.equalTo(cancelButton.snp.top).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
    }
    
}
