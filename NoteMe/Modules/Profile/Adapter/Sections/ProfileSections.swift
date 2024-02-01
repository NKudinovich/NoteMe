//
//  ProfileSections.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 23.01.24.
//

import UIKit

fileprivate enum L10n {
    static let accountHeaderTitle: String = "profileVC_tableHeader_Account".localizable
    static let settingsHeaderTitle: String = "profileVC_tableHeader_Settings".localizable
    static let notificationsRowTitle: String =
        "profileVC_tableRow_Notifications".localizable
    static let exportRowTitle: String = "profileVC_tableRow_Export".localizable
    static let logoutRowTitle: String = "profileVC_tableRow_Logout".localizable
}

enum ProfileSections {
    
    case account(String)
    case settings([ProfileSettingsRows])
    
    var numberOfRows: Int {
        switch self {
        case .settings(let rows): return rows.count
        default: return 1
        }
    }
    
    var headerText: String {
        switch self {
        case .account: return L10n.accountHeaderTitle
        case .settings: return L10n.settingsHeaderTitle
        }
    }
    
}

enum ProfileSettingsRows: CaseIterable {
    
    case notifications
    case export
    case logout
    
    var icon: UIImage {
        switch self {
        case .notifications: return .Profile.notifications
        case .export: return .Profile.export
        case .logout: return .Profile.logout
        }
    }
    
    var title: String {
        switch self {
        case .notifications: return L10n.notificationsRowTitle
        case .export: return L10n.exportRowTitle
        case .logout: return L10n.logoutRowTitle
        }
    }
    
    var infoText: String? {
        switch self {
        case .export: return "Now"
        default: return nil
        }
    }
}
