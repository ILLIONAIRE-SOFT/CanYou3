//
//  Computer.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class Computer {
    // dataController
    let dc: DataController = (UIApplication.shared.delegate as! AppDelegate).dataController
    
    // Properties about time
    var timeElapsed: TimeInterval {
        let startDate = dc.currentUser.startDate!
        return NSDate().timeIntervalSince1970 - startDate.timeIntervalSince1970
    }
    var day: UInt32 {
        return UInt32((timeElapsed / 86400.0))
    }
    var hours: UInt16 {
        return UInt16((timeElapsed / 3600.0).truncatingRemainder(dividingBy: 24))
    }
    var minutes: UInt8 {
        return UInt8((timeElapsed / 60.0).truncatingRemainder(dividingBy: 60))
    }
    var seconds: UInt8 {
        return UInt8(timeElapsed.truncatingRemainder(dividingBy: 60))
    }
}
