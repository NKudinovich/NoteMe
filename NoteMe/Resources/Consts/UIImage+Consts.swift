//
//  UIImage+Consts.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 24.10.23.
//

import UIKit

extension UIImage {
    
    //MARK: - General
    enum General {
        static let logo: UIImage = .init(named: "logo")!
    }
    
    enum Onboarding {
        static let onboardingList: UIImage = .init(named: "onboardingList")!
    }
    
    enum Profile {
        static let profileTabIcon: UIImage = .init(named: "profileIcon")!
        static let notifications: UIImage = .init(named: "notificationsIcon")!
        static let export: UIImage = .init(named: "exportIcon")!
        static let logout: UIImage = .init(named: "logoutIcon")!
        
    }
}
