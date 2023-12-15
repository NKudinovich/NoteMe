//
//  LoginVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 24.10.23.
//

import UIKit
import SnapKit

@objc protocol LoginViewModelProtocol: AnyObject {
    var catchEmailError: ((String?) -> Void)? { get set }
    var catchPasswordError: ((String?) -> Void)? { get set }
    
    var keyboardChangedFrame: ((CGRect) -> Void)? { get set }
    
    func loginDidTap(email: String?, password: String?)
    @objc func newAccountDidTap()
    func forgotPasswordDidTap(email: String?)
}

protocol LoginKeyboardAnimatorUseCase {
    func moveView(for targetView: UIView,
                  frame: CGRect,
                  padding: CGFloat)
}

final class LoginVC: UIViewController {
    
    //Keys with localization
    private enum L10n {
        static let welcomeTitleLable: String = "loginVC_welcome_title".localizable
        static let loginButton: String = "loginVC_login_btn".localizable
        static let newAccountButton: String = "loginVC_new_account_btn".localizable
        static let forgotPasswordButton: String = "loginVC_forgot_password_btn".localizable
        static let emailTextFieldTitle: String = "loginVC_email".localizable
        static let emailTextFieldPlaceholder: String = "loginVC_enter_email".localizable
        static let passwordTextFieldTitle: String = "loginVC_password".localizable
        static let passwordTextFieldPlaceholder: String = "loginVC_enter_password".localizable
    }
    
    private let keyboardAnimator: LoginKeyboardAnimatorUseCase
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var welcomeTitleLabel: UILabel = .mainTitleLabel(L10n.welcomeTitleLable)
    
    private lazy var loginButton: UIButton =
        .yellowRoundedButton(L10n.loginButton)
        .withAction(self, #selector(loginDidTap))
    private lazy var newAccountButton: UIButton =
        .underlineYellowButton(L10n.newAccountButton)
        .withAction(viewModel, #selector(LoginViewModelProtocol.newAccountDidTap))
    private lazy var forgotPasswordButton: UIButton =
        .underlineGrayButton(L10n.forgotPasswordButton)
        .withAction(self, #selector(forgotPasswordDidTap))
    
    private lazy var infoView: UIView = .roundedViewWithShadow()
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.emailTextFieldTitle
        textField.placeholder = L10n.emailTextFieldPlaceholder
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
       let textField = LineTextField()
        textField.title = L10n.passwordTextFieldTitle
        textField.placeholder = L10n.passwordTextFieldPlaceholder
        return textField
    }()
    
    private var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol,
         keyboardAnimator: LoginKeyboardAnimatorUseCase) {
        self.viewModel = viewModel
        self.keyboardAnimator = keyboardAnimator
        
        super.init(nibName: nil, bundle: nil)
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func bind() {
        
        viewModel.catchEmailError = { errorText in
            self.emailTextField.errorText = errorText
        }
        
        viewModel.catchPasswordError = {
            self.passwordTextField.errorText = $0
        }
        
        viewModel.keyboardChangedFrame = {
            self.keyboardAnimator.moveView(for: self.infoView,
                                           frame: $0,
                                           padding: 36.0)
        }
        
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(newAccountButton)
        view.addSubview(loginButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(infoView)
        contentView.addSubview(welcomeTitleLabel)
        
        logoContainer.addSubview(logoImageView)
        
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
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(welcomeTitleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
        
        welcomeTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
    }
    
    @objc private func loginDidTap() {
        viewModel.loginDidTap(email: emailTextField.text,
                              password: passwordTextField.text)
    }
        
    @objc private func forgotPasswordDidTap() {
        viewModel.forgotPasswordDidTap(email: emailTextField.text)
    }
}
