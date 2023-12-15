//
//  HomeCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 12.12.23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    override func start() -> UIViewController {
        return HomeAssembler.make()
    }
    
}
