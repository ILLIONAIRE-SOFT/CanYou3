//
//  User+CoreDataProperties.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var alarm: Bool
    @NSManaged public var birthDate: NSDate?
    @NSManaged public var canValue: Int32
    @NSManaged public var cigaretteDaily: Int16
    @NSManaged public var cigarettePrice: Int16
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var randomAlarm: Bool
    @NSManaged public var startDate: NSDate?
    @NSManaged public var isFirst: Bool
    @NSManaged public var badges: NSSet?
    @NSManaged public var rewards: NSSet?

}

// MARK: Generated accessors for badges
extension User {

    @objc(addBadgesObject:)
    @NSManaged public func addToBadges(_ value: Badge)

    @objc(removeBadgesObject:)
    @NSManaged public func removeFromBadges(_ value: Badge)

    @objc(addBadges:)
    @NSManaged public func addToBadges(_ values: NSSet)

    @objc(removeBadges:)
    @NSManaged public func removeFromBadges(_ values: NSSet)

}

// MARK: Generated accessors for rewards
extension User {

    @objc(addRewardsObject:)
    @NSManaged public func addToRewards(_ value: Reward)

    @objc(removeRewardsObject:)
    @NSManaged public func removeFromRewards(_ value: Reward)

    @objc(addRewards:)
    @NSManaged public func addToRewards(_ values: NSSet)

    @objc(removeRewards:)
    @NSManaged public func removeFromRewards(_ values: NSSet)

}
