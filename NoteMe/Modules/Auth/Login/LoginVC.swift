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
    
    private lazy var newAccountButton: UIButton = {
        let button = UIButton()
        button.buttonUnderlineStyle(title: "New Account", color: .appYellow)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.buttonMainStyle(title: "Login")
        return button
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
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(45.0)
            make.bottom.equalTo(newAccountButton.snp.top).inset(8.0)
        }
    }
}
