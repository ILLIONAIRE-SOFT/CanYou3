//
//  User+CoreDataClass.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

    var timeInterval: TimeInterval {
        guard let date = self.startDate else { return 0 }
        return Date().timeIntervalSince(date as Date)
    }
    
}
