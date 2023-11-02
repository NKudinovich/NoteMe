//
//  RegisterVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 2.11.23.
//

import UIKit
import SnapKit

final class RegisterVC: UIViewController {
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var registerTitle: UILabel = .mainTitleLabel("Nice to meet you!")
    
    private lazy var infoView: UIView = .roundedViewWithShadow()

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
    private lazy var repeatPasswordTextField: LineTextField = {
       let textField = LineTextField()
        textField.title = "Repeat Password"
        textField.placeholder = "Enter Password"
        return textField
    }()
    
    private lazy var registerButton: UIButton = .yellowRoundedButton("Register")
    private lazy var haveAccButton: UIButton = .underlineYellowButton("I have an Account")
    
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
        contentView.addSubview(haveAccButton)
        contentView.addSubview(registerButton)
        contentView.addSubview(registerTitle)
        
        infoView.addSubview(emailTextField)
        infoView.addSubview(passwordTextField)
        infoView.addSubview(repeatPasswordTextField)
    }
    
    private func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(registerButton.snp.centerY)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.top.equalTo(emailTextField.snp.bottom).inset(-16.0)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(20.0)
        }
        
        haveAccButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(20.0)
        }
        
        registerButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(haveAccButton.snp.top).inset(-8.0)
            make.height.equalTo(45.0)
        }
        
        registerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
    }
}
