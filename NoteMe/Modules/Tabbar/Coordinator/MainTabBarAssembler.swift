//
//  MainTabBarAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 12.12.23.
//

import UIKit

final class MainTabBarAssembler {
    private init() {}
    
    static func make() -> UITabBarController {
        let tabbar = MainTabBarVC()
        
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .purple
        
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .red
        
        tabbar.viewControllers = [homeVC, profileVC]
        
        return tabbar
    }
}
