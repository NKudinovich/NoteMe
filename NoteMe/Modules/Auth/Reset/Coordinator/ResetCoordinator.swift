//
//  RegisterCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 26.11.23.
//

import UIKit

final class ResetCoordinator: Coordinator {
    override func start() -> UIViewController {
        return ResetAssembler.make(coordinator: self)
    }
}

extension ResetCoordinator: ResetCoordinatorProtocol {}
