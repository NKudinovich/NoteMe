//
//  MainTabBarCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 12.12.23.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let tabBar = MainTabBarAssembler.make()
        tabBar.viewControllers = [makeHomeModule(), makeProfileModule()]
        
        return tabBar
    }
    
    private func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinator()
        children.append(coordinator)
        
        return coordinator.start()
    }
    
    private func makeProfileModule() -> UIViewController {
        let coordinator = ProfileCoordinator(container: container)
        children.append(coordinator)
        
        return coordinator.start()
    }
    
}
