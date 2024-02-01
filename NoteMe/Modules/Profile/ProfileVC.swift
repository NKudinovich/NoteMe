//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 13.12.23.
//

import UIKit
import SnapKit

protocol ProfileViewModelProtocol {
    func makeTableView() -> UITableView
}

final class ProfileVC: UIViewController {
    
    private var viewModel: ProfileViewModelProtocol
    
    private lazy var contentView: UIView = .contentView()
    private lazy var tableView: UITableView = viewModel.makeTableView()
    
    init(viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setupTabBarItem()
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
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        
        contentView.addSubview(tableView)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
        tableView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(16.0)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: "Profile",
                                       image: .Profile.profileTabIcon,
                                       tag: .zero)
    }
    
}
