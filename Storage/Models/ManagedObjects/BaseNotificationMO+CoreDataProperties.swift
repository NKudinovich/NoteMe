//
//  BaseNotificationMO+CoreDataProperties.swift
//  Storage
//
//  Created by Nikita Kudinovich on 30.01.24.
//
//

import Foundation
import CoreData


extension BaseNotificationMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BaseNotificationMO> {
        return NSFetchRequest<BaseNotificationMO>(entityName: "BaseNotificationMO")
    }

    @NSManaged public var date: Date?
    @NSManaged public var identifier: String?
    @NSManaged public var title: String?
    @NSManaged public var subTitle: String?
    @NSManaged public var completedData: Date?

}

extension BaseNotificationMO : Identifiable {

}
