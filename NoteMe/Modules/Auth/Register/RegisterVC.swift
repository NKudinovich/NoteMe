//
//  RegisterVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 2.11.23.
//

import UIKit
import SnapKit

@objc protocol RegisterPresenterProtocol: AnyObject {
    func registerDidTap(email: String?,
                        password: String?,
                        repeatPassword: String?)
    @objc func haveAccountDidTap()
}

final class RegisterVC: UIViewController {
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var registerTitleLabel: UILabel =
        .mainTitleLabel("registerVC_register_title".localizable)
    
    private lazy var infoView: UIView = .roundedViewWithShadow()

    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "registerVC_email".localizable
        textField.placeholder = "registerVC_enter_email".localizable
        return textField
    }()
    private lazy var passwordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "registerVC_password".localizable
        textField.placeholder = "registerVC_enter_password".localizable
        return textField
    }()
    private lazy var repeatPasswordTextField: LineTextField = {
       let textField = LineTextField()
        textField.title = "registerVC_repeat_password".localizable
        textField.placeholder = "registerVC_enter_password".localizable
        return textField
    }()
    
    private lazy var registerButton: UIButton =
        .yellowRoundedButton("registerVC_register_btn".localizable)
        .withAction(self, #selector(registerDidTap))
    private lazy var haveAccButton: UIButton =
        .underlineYellowButton("registerVC_have_account_btn".localizable)
        .withAction(presenter, #selector(RegisterPresenterProtocol.haveAccountDidTap))
    
    private var presenter: RegisterPresenterProtocol
    
    init(presenter: RegisterPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(haveAccButton)
        view.addSubview(registerButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(infoView)
        contentView.addSubview(registerTitleLabel)
        
        logoContainer.addSubview(logoImageView)
        
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
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(registerTitleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
            make.height.equalTo(20.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        registerButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(haveAccButton.snp.top).inset(-8.0)
            make.height.equalTo(45.0)
        }
        
        registerTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
    }
    
    @objc private func registerDidTap() {
        presenter.registerDidTap(email: emailTextField.text,
                                 password: passwordTextField.text,
                                 repeatPassword: repeatPasswordTextField.text)
    }
}

extension RegisterVC: RegisterPresenterDelegate {
    func setEmailError(error: String?) {
        emailTextField.errorText = error
    }
    
    func setPasswordError(error: String?) {
        passwordTextField.errorText = error
    }
    
    func setRepeatPasswordError(error: String?) {
        repeatPasswordTextField.errorText = error
    }
    
    func keyboardFrameChanged(_ frame: CGRect) {
        let maxY = infoView.frame.maxY + contentView.frame.minY + 16.0
        let keyboardY = frame.minY
        
        if maxY > keyboardY {
            let diff = maxY - keyboardY
            UIView.animate(withDuration: 0.25) {
                self.infoView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview().offset(-diff)
                }
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                self.infoView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview()
                }
                self.view.layoutIfNeeded()
            }
        }
    }
}
