//
//  HomeVC.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 12.12.23.
//

import UIKit


final class HomeVC: UIViewController {
    
    private enum L10n {
        static let home: String = "home".localizable
    }
    
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
        view.backgroundColor = .appGray
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: "Home",
                                      image: UIImage(systemName: "house.fill"),
                                       tag: .zero)
    }
    
}
