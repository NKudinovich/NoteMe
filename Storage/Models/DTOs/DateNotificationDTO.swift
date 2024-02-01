//
//  DateNotificationDTO.swift
//  Storage
//
//  Created by Nikita Kudinovich on 30.01.24.
//

import Foundation

public struct DateNotificationDTO {
    
    public var date: Date
    public var id: String
    public var title: String
    public var subTitle: String?
    public var completedData: Date?
    public var targetDate: Date
    
    public init(date: Date,
         id: String,
         title: String,
         subTitle: String? = nil,
         completedData: Date? = nil,
         targetDate: Date) {
        self.date = date
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.completedData = completedData
        self.targetDate = targetDate
    }
    
    init?(mo: DateNotificationMO) {
        guard
            let id = mo.identifier,
            let title = mo.title,
            let date = mo.date,
            let targetDate = mo.targetDate
        else { return nil }
        
        self.date = date
        self.id = id
        self.title = title
        self.subTitle = mo.subTitle
        self.completedData = mo.completedData
        self.targetDate = targetDate
    }
    
}
