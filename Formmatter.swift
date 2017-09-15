//
//  Formmatter.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 14..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation

struct Formatter {
    static func string(fromDate date: NSDate) -> String{
        let df = DateFormatter().then {
            $0.dateFormat = "yyyy. MM. dd"
        }
        
        return df.string(from: date as Date)
    }
    
    
    
    static func string(fromNumber num: NSNumber) -> String {
        let numberFormatter = NumberFormatter().then {
            $0.numberStyle = .decimal
        }
        
        return numberFormatter.string(from: num)!
    }
    
}
