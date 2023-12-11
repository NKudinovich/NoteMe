//
//  NSAttributedString+HTML.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 11.12.23.
//

import UIKit

extension NSAttributedString {
    
    static func parse(html: String, font: UIFont) -> NSAttributedString? {
        let fontfamilyName = font.familyName
        let fontSize = font.pointSize
        
        if
            let data = "<span style =\"font-family: '-apple-system', '\(fontfamilyName)'; font-size: \(fontSize)\">\(html)</span>"
                .data(using: .utf16) {
            return try? NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil)
        }
        return nil
    }
    
}
