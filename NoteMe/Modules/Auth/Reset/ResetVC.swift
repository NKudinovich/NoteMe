//
//  ResetVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 2.11.23.
//

import UIKit
import SnapKit

@objc protocol ResetViewModelProtocol: AnyObject {
    var catchEmailError: ((String?) -> Void)? { get set }
    var keyboardFrameChanged: ((CGRect) -> Void)? { get set }
    
    func resetDidTap(email: String?)
    @objc func cancelDidTap()
}

protocol ResetKeyboardAnimatorUseCase {
    func moveView(for targetView: UIView,
                  frame: CGRect,
                  padding: CGFloat)
}

final class ResetVC: UIViewController {
    
    //Keys with localization
    private enum L10n {
        static let resetTitleLabel: String = "resetVC_reset_title".localizable
        static let infoText: String = "resetVC_reset_info_text".localizable
        static let emailTextFieldPlaceholder: String = "resetVC_enter_email".localizable
        static let resetButton: String = "resetVC_reset_btn".localizable
    }
    
    private let keyboardAnimator: ResetKeyboardAnimatorUseCase
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var resetPasswordTitle: UILabel = .mainTitleLabel(L10n.resetTitleLabel)
    
    private lazy var infoView: UIView = .roundedViewWithShadow()
    
    private lazy var infoViewText: UILabel =
        .infoViewText(L10n.infoText)
    
    private lazy var resetPasswordTextField: LineTextField = {
        let textField = LineTextField()
        textField.placeholder = L10n.emailTextFieldPlaceholder
        return textField
    }()
    
    private lazy var resetButton: UIButton =
        .yellowRoundedButton(L10n.resetButton)
        .withAction(self, #selector(resetDidTap))
    private lazy var cancelButton: UIButton =
        .appCancelButton()
        .withAction(viewModel, #selector(ResetViewModelProtocol.cancelDidTap))
    
    private var viewModel: ResetViewModelProtocol
    
    init(viewModel: ResetViewModelProtocol,
         keyboardAnimator: ResetKeyboardAnimatorUseCase) {
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
            self.resetPasswordTextField.errorText = errorText
        }
        
        viewModel.keyboardFrameChanged = {
            self.keyboardAnimator.moveView(for: self.infoView,
                                           frame: $0,
                                           padding: 36.0)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(cancelButton)
        view.addSubview(resetButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(infoView)
        contentView.addSubview(resetPasswordTitle)
        
        logoContainer.addSubview(logoImageView)
        
        infoView.addSubview(infoViewText)
        infoView.addSubview(resetPasswordTextField)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(resetButton.snp.centerY)
        }
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(resetPasswordTitle.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
    
    @objc private func resetDidTap() {
        viewModel.resetDidTap(email: resetPasswordTextField.text)
    }
}
