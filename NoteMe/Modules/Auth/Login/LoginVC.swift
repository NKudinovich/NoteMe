//
//  LoginVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 24.10.23.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }()
    
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var loginButton: UIButton = .yellowRoundedButton("Login")
    private lazy var newAccountButton: UIButton = .underlineYellowButton("New Account")
    private lazy var forgotPasswordButton: UIButton = .underlineGrayButton("Forgot Password")
    
    private lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.cornerRadius = 5.0
        return view
    }()
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "E-mail"
        textField.placeholder = "Enter E-mail"
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
       let textField = LineTextField()
        textField.title = "Password"
        textField.placeholder = "Enter Password"
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
            make.centerX.equalToSuperview()
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
    }
}
