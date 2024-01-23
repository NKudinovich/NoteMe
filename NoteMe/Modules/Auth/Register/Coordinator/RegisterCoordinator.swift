//
//  RegisterCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 21.11.23.
//

import UIKit

final class RegisterCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = RegisterAssembler.make(container: container,
                                        coordinator: self)
        rootVC = vc
        return vc
    }
    
}

extension RegisterCoordinator: RegisterCoordinatorProtocol {
    func showAlert(_ alert: UIAlertController) {
        rootVC?.present(alert, animated: true)
    }
}
