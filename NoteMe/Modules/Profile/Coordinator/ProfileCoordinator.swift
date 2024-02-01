//
//  ProfileCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 13.12.23.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = ProfileAssembler.make(coordinator: self,
                                       container: container)
        rootVC = vc
        return vc
    }
    
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {}
