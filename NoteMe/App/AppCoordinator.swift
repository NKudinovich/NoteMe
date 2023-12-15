//
//  AppCoordinator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 21.11.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    static var windowScene: UIWindowScene?
    
    private var window: UIWindow
    
    init(scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
        Self.windowScene = scene
    }
    
    func startApp() {
        //FIX: - TESTCODE
        openAuthModule()
//        openMainApp()
//        openOnboardingModule()
        
        //FIX: - Need update this code
//        if ParametersHelper.get(.authenticated) {
//            //open onboarding or mainApp
//            openOnboardingModule()
//        } else {
//            openAuthModule()
//        }
    }
    
    private func openAuthModule() {
        let coordinator = LoginCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func openOnboardingModule() {
        let coordinator = OnboardFirstStepCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func openMainApp() {
        let coordinator = MainTabBarCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
}
