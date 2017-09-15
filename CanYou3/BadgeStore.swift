//
//  BadgeStore.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class BadgeStore: BaseStore {
    static func createItem(user: User, name: String, imageName: String, content: String, conditionType: ConditionType, conditionValue: Double) {
        self.dc.managedObjectContext.perform{
            let item = self.dc.newBadge()
            
            item.name = name
            item.imageName = imageName
            item.content = content
            item.conditionTypeStr = conditionType.rawValue
            item.conditionValue = conditionValue
            
            item.user = user
            
            self.dc.saveContext()
        }
    }
}
