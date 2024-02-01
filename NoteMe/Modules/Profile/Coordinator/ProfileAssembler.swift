//
//  ProfileAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 13.12.23.
//

import UIKit

final class ProfileAssembler {
    private init() {}
    
    static func make(coordinator: ProfileCoordinatorProtocol,
                     container: Container) -> UIViewController {
        let authService: AuthService = container.resolve()
        let alertService: AlertService = container.resolve()
        let adapter = ProfileAdapter()
        
        let vm = ProfileVM(cooridnator: coordinator,
                                  authService: authService,
                                  alertService: alertService,
                                  adapter: adapter)
        
        let vc = ProfileVC(viewModel: vm)
        return vc
    }
}
