//
//  ProfileAssembler.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 13.12.23.
//

import UIKit

final class ProfileAssembler {
    private init() {}
    
    static func make() -> UIViewController {
        return ProfileVC()
    }
}
