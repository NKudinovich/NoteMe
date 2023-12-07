//
//  RegisterCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 26.11.23.
//

import UIKit

final class ResetCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    
    override func start() -> UIViewController {
        let vc = ResetAssembler.make(coordinator: self)
        rootVC = vc
        return vc
    }
    
    func showAlert(_ alert: UIAlertController) {
        rootVC?.present(alert, animated: true)
    }
}

extension ResetCoordinator: ResetCoordinatorProtocol {}
