//
//  Badge+CoreDataClass.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation
import CoreData

enum ConditionType: String {
    case time
    case cigarette
    case money
    case reward
    
    static let allValues = [time,
                            cigarette,
                            money,
                            reward]
    
    static let defaultType: ConditionType = .time
}

@objc(Badge)
public class Badge: NSManagedObject {
    var conditionType: ConditionType {
        get {
            if let str = self.conditionTypeStr,
                let conditionType = ConditionType.init(rawValue: str) {
                return conditionType
            } else {
                return .defaultType
            }
        }
        set {
            self.conditionTypeStr = newValue.rawValue
        }
    }
}
