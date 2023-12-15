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
    
    //Keys with localization
    private enum L10n {
        static let mainTitleLabel: String = "onboardSecondVC_main_title".localizable
        static let infoViewTitle: String = "onboardSecondVC_infoView_text_title".localizable
        static let infoViewCalendar: String = "onboardSecondVC_infoView_text_calendar".localizable
        static let infoViewLocation: String = "onboardSecondVC_infoView_text_location".localizable
        static let infoViewTimer: String = "onboardSecondVC_infoView_text_timer".localizable
        static let listCalendar: String = "onboardSecondVC_list_calendar".localizable
        static let listLocation: String = "onboardSecondVC_list_location".localizable
        static let listTimer: String = "onboardSecondVC_list_timer".localizable
        static let doneButton: String = "onboardSecondVC_done_button".localizable
    }
    
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView = UIImageView(image: .General.logo)
    
    private lazy var secondOnboardTitleLabel: UILabel =
        .mainTitleLabel(L10n.mainTitleLabel)
    
    private lazy var infoView: UIView = .roundedViewWithShadow()
    private lazy var infoViewText: UILabel =
        .infoViewText(L10n.infoViewTitle)
    private lazy var infoViewTextCalendar: UILabel =
        .textWithHTML(L10n.infoViewCalendar)
    private lazy var infoViewTextLocation: UILabel =
        .textWithHTML(L10n.infoViewLocation)
    private lazy var infoViewTextTimer: UILabel =
        .textWithHTML(L10n.infoViewTimer)
    
    private lazy var listContainer: UIView = UIView()
    private lazy var listImageView: UIImageView = UIImageView(image: .Onboarding.onboardingList)
    private lazy var listCalendarLabelText: UILabel =
        .listOnboardLabel(L10n.listCalendar)
    private lazy var listLocationLabelText: UILabel =
        .listOnboardLabel(L10n.infoViewLocation)
    private lazy var listTimerLabelText: UILabel =
        .listOnboardLabel(L10n.infoViewTimer)
    
    private lazy var doneButton: UIButton =
        .yellowRoundedButton(L10n.doneButton)
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
        
        listImageView.addSubview(listCalendarLabelText)
        listImageView.addSubview(listLocationLabelText)
        listImageView.addSubview(listTimerLabelText)
        
        infoView.addSubview(infoViewText)
        infoView.addSubview(infoViewTextCalendar)
        infoView.addSubview(infoViewTextLocation)
        infoView.addSubview(infoViewTextTimer)
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
            make.bottom.equalTo(infoViewTextTimer.snp.bottom).inset(-16.0)
        }
        
        infoViewText.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        infoViewTextCalendar.snp.makeConstraints { make in
            make.top.equalTo(infoViewText.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        infoViewTextLocation.snp.makeConstraints { make in
            make.top.equalTo(infoViewTextCalendar.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        infoViewTextTimer.snp.makeConstraints { make in
            make.top.equalTo(infoViewTextLocation.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16.0)
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
        
        listCalendarLabelText.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22.0)
            make.left.equalToSuperview().inset(30.0)
        }
        
        listLocationLabelText.snp.makeConstraints { make in
            make.top.equalTo(listCalendarLabelText.snp.bottom).inset(-16.0)
            make.left.equalToSuperview().inset(30.0)
        }
        
        listTimerLabelText.snp.makeConstraints { make in
            make.top.equalTo(listLocationLabelText.snp.bottom).inset(-16.0)
            make.left.equalToSuperview().inset(30.0)
        }
        
        doneButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16.0)
            make.height.equalTo(45.0)
        }
    }
    
}
