//
//  OnboardSecondStepVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 28.11.23.
//

import UIKit
import SnapKit

@objc protocol OnboardSecondStepViewModelProtocole {
    @objc func doneDidTap()
    func dismissedByUser()
}

final class OnboardSecondStepVC: UIViewController {
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView = UIImageView(image: .General.logo)
    
    private lazy var secondOnboardTitleLabel: UILabel =
        .mainTitleLabel("onboardSecondVC_main_title".localizable)
    
    private lazy var infoView: UIView = .roundedViewWithShadow()
    
    private lazy var listContainer: UIView = UIView()
    private lazy var listImageView: UIImageView = UIImageView(image: .General.onboardingList)
    
    private lazy var doneButton: UIButton =
        .yellowRoundedButton("onboardSecondVC_done_button".localizable)
        .withAction(viewModel, #selector(OnboardSecondStepViewModelProtocole.doneDidTap))
        
    private let viewModel: OnboardSecondStepViewModelProtocole
    
    init(viewModel: OnboardSecondStepViewModelProtocole) {
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.dismissedByUser()
    }
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(doneButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(infoView)
        contentView.addSubview(secondOnboardTitleLabel)
        contentView.addSubview(listContainer)
        
        logoContainer.addSubview(logoImageView)
        listContainer.addSubview(listImageView)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(doneButton.snp.centerY)
        }
        
        logoContainer.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalTo(secondOnboardTitleLabel)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        secondOnboardTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
            make.height.equalTo(140.0)
        }
        
        listContainer.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(infoView.snp.bottom)
        }
        
        listImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(157.0)
            make.width.equalTo(180.0)
        }
        
        doneButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16.0)
            make.height.equalTo(45.0)
        }
    }
    
}
