//
//  ProfileVM.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 23.01.24.
//

import UIKit

protocol ProfileCoordinatorProtocol: AnyObject {
    func finish()
}

protocol ProfileAdapterProtocol {
    var didSelectRow: ((ProfileSettingsRows) -> Void)? { get set }
    
    func reloadData(with sections: [ProfileSections])
    func makeTableView() -> UITableView
}

protocol ProfileAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
    func showAlert(title: String?,
                   message: String?,
                   cancelTitle: String?,
                   cancelStyle: UIAlertAction.Style?,
                   okTitle: String?,
                   okHandler: (() -> Void)?,
                   okStyle: UIAlertAction.Style?)
}

protocol ProfileAuthServiceUseCase {
    func getCurrentUserName() -> String?
    func logout(completion: @escaping ((Result<Void, Error>) -> Void))
}



final class ProfileVM: ProfileViewModelProtocol {

    private enum L10n {
        static let testName: String = "testName".localizable
    }
    
    private weak var cooridnator: ProfileCoordinatorProtocol?
    private let authService: ProfileAuthServiceUseCase
    private let alertService: ProfileAlertServiceUseCase
    private var adapter: ProfileAdapterProtocol
    
    private let username: String = L10n.testName
    
    private var sections: [ProfileSections] {
        return [
            .account(username),
            .settings(ProfileSettingsRows.allCases)
        ]
    }
    
    init(cooridnator: ProfileCoordinatorProtocol,
         authService: ProfileAuthServiceUseCase,
         alertService: ProfileAlertServiceUseCase,
         adapter: ProfileAdapterProtocol) {
        self.cooridnator = cooridnator
        self.authService = authService
        self.alertService = alertService
        self.adapter = adapter
        
        bind()
    }
    
    private func bind() {
        adapter.reloadData(with: sections)
        
        //TEST ACTIONS
#warning("change actions")
        adapter.didSelectRow = { [weak self] row in
            switch row {
            case .notifications: print("notifications did tapped")
            case .export: print("export did tapped")
            case .logout: print("logout did tapped")
            }
        }
    }
    
    func logout() {
        alertService.showAlert(title: "Logout",
                               message: "Logout?",
                               cancelTitle: "Cancel",
                               cancelStyle: .default,
                               okTitle: "Yes",
                               okHandler: {
            self.didSelectLogout()
        },
                               okStyle: .destructive)
    }
    
    private func didSelectLogout() {
        authService.logout { [weak self] result in
            switch result {
            case .success(_):
                ParametersHelper.set(.authenticated, value: false)
                self?.cooridnator?.finish()
            case .failure(_):
                self?.alertService.showAlert(title: "Error",
                                             message: "Some error",
                                             okTitle: "ok")
            }
        }
    }
    
    func makeTableView() -> UITableView {
        adapter.makeTableView()
    }
    
}
