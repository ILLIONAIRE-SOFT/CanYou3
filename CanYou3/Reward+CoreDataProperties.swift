//
//  Reward+CoreDataProperties.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 14..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation
import CoreData


extension Reward {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reward> {
        return NSFetchRequest<Reward>(entityName: "Reward")
    }

    @NSManaged public var content: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var name: String?
    @NSManaged public var price: Int16
    @NSManaged public var user: User?

}
