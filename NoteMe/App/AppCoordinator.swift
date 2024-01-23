//
//  AppCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 21.11.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let container: Container
    private let windowManager: WindowManager
    
    init(container: Container) {
        self.container = container
        self.windowManager = container.resolve()
    }
    
    func startApp() {
        //FIX: - TESTCODE
        openAuthModule()
//        openMainApp()
//        openOnboardingModule()
        
        
//        if ParametersHelper.get(.onboarded) {
//            openMainApp()
//        } else if ParametersHelper.get(.authenticated) {
//            openOnboardingModule()
//        } else {
//            openAuthModule()
//        }
    }
    
    private func openAuthModule() {
        let coordinator = LoginCoordinator(container: container)
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        let window = windowManager.get(type: .main)
        window.rootViewController = vc
        windowManager.show(type: .main)
//        window.rootViewController = vc
//        window.makeKeyAndVisible()
    }
    
    private func openOnboardingModule() {
        let coordinator = OnboardFirstStepCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        let window = windowManager.get(type: .main)
        window.rootViewController = vc
        windowManager.show(type: .main)
    }
    
    private func openMainApp() {
        let coordinator = MainTabBarCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        let window = windowManager.get(type: .main)
        window.rootViewController = vc
        windowManager.show(type: .main)
    }
    
}
