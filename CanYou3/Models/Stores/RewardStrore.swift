//
//  RewardStrore.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class RewardStore: BaseStore {
    static func createItem(user: User, name: String, content: String) {
        self.dc.managedObjectContext.perform{
            let item = self.dc.newReward()
            
            item.name = name
            item.content = content
            item.user = user
            
            self.dc.saveContext()
        }
    }
}
