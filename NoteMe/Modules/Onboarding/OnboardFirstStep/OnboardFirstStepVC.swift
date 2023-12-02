//
//  OnboardFirstStepVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 28.11.23.
//

import UIKit
import SnapKit

@objc protocol OnboardFirstStepViewModelProtocol {
    @objc func nextDidTap()
}

final class OnboardFirstStepVC: UIViewController {
 
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView = UIImageView(image: .General.logo)
    
    private lazy var firstOnboardTitleLabel: UILabel =
        .mainTitleLabel("onboardFirstVC_main_title".localizable)
    
    private lazy var infoView: UIView = .roundedViewWithShadow()
    
    private lazy var infoTextLabel: UILabel =
        .infoViewText("onboardFirstVC_infoView_text".localizable)
    
    private lazy var nextButton: UIButton =
        .yellowRoundedButton("onboardFirstVC_next_button".localizable)
        .withAction(viewModel, #selector(OnboardFirstStepViewModelProtocol.nextDidTap))
    
    private var viewModel: OnboardFirstStepViewModelProtocol
    
    init(viewModel: OnboardFirstStepViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(nextButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(firstOnboardTitleLabel)
        contentView.addSubview(infoView)
        
        logoContainer.addSubview(logoImageView)
        
        infoView.addSubview(infoTextLabel)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(nextButton.snp.centerY)
        }
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(firstOnboardTitleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        firstOnboardTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
            make.centerX.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.height.equalTo(65.0)
        }
        
        infoTextLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.top.equalToSuperview().inset(8.0)
        }
        
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16.0)
            make.height.equalTo(45.0)
        }
    }
    
}
