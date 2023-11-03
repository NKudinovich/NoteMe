//
//  LoginVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 24.10.23.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var welcomeTitle: UILabel = .mainTitleLabel("welcome_title".localizable)
    
    private lazy var loginButton: UIButton = .yellowRoundedButton("login_btn".localizable)
    private lazy var newAccountButton: UIButton = .underlineYellowButton("new_account_btn".localizable)
    private lazy var forgotPasswordButton: UIButton =
        .underlineGrayButton("forgot_password_btn".localizable)
    
    private lazy var infoView: UIView = .roundedViewWithShadow()
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "email".localizable
        textField.placeholder = "enter_email".localizable
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
       let textField = LineTextField()
        textField.title = "password".localizable
        textField.placeholder = "enter_password".localizable
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(newAccountButton)
        contentView.addSubview(loginButton)
        contentView.addSubview(infoView)
        contentView.addSubview(welcomeTitle)
        
        infoView.addSubview(forgotPasswordButton)
        infoView.addSubview(emailTextField)
        infoView.addSubview(passwordTextField)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(loginButton.snp.centerY)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        newAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.height.equalTo(20.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        loginButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(45.0)
            make.bottom.equalTo(newAccountButton.snp.top).inset(-8.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
            
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview().inset(16.0)
            make.height.equalTo(17.0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.top.equalTo(emailTextField.snp.bottom).inset(-16.0)
            make.bottom.equalTo(forgotPasswordButton.snp.top).inset(-20.0)
        }
        
        welcomeTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
    }
}
