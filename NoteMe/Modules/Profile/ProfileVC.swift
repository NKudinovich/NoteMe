//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 13.12.23.
//

import UIKit

final class ProfileVC: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .appRed
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.fill"),
                                       tag: .zero)
    }
    
}
