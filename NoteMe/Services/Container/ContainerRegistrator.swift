//
//  ContainerRegistrator.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 16.01.24.
//

import Foundation

final class ContainerRegistrator {
    
    static func makeContainer() -> Container {
        let container = Container()
        
        container.register({ AlertService(container: container) })
        container.register({ AuthService() })
        container.register({ KeyboardHelper() })
        container.register({ KeyboardAnimator() })
        container.register({ InputValidator() })
        container.register({ KeyboardAnimator() })
        
        return container
    }
    
}
