//
//  Versions.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 14..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation

struct Versions {
    struct VersionInfo {
        var version: String
        var content: String
    }
    
    static var latest: VersionInfo {
        return v1
    }
    
    static let v1 = VersionInfo(version: "v1.0.0", content: "version 1")
}
