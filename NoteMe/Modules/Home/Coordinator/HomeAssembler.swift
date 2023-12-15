//
//  HomeAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 12.12.23.
//

import UIKit

final class HomeAssembler {
    private init() {}
    
    static func make() -> UIViewController {
        return HomeVC()
    }
}
