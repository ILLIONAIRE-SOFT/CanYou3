//
//  HealthInfo+CoreDataProperties.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation
import CoreData


extension HealthInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HealthInfo> {
        return NSFetchRequest<HealthInfo>(entityName: "HealthInfo")
    }

    @NSManaged public var content: String?
    @NSManaged public var name: String?
    @NSManaged public var time: Double

}
