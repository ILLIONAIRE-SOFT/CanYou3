//
//  HealthInfoStore.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit
import Then

class HealthInfoStore: BaseStore {
    static func createItem(name: String, time: Double, content: String) {
        self.dc.managedObjectContext.perform{
            let item = self.dc.newHealthInfo()
            item.name = name
            item.time = time
            item.content = content
            self.dc.saveContext()
        }
    }
}

