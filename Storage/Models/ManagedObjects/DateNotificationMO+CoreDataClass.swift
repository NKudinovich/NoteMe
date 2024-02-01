//
//  DateNotificationMO+CoreDataClass.swift
//  Storage
//
//  Created by Nikita Kudinovich on 30.01.24.
//
//

import Foundation
import CoreData

@objc(DateNotificationMO)
class DateNotificationMO: BaseNotificationMO {
    func apply(dto: DateNotificationDTO) {
//        self.id = dto.id
        self.date = dto.date
        self.title = dto.title
        self.subTitle = dto.subTitle
        self.completedData = dto.completedData
        self.targetDate = dto.targetDate
    }
}
