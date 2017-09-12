//
//  StoryboardName.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 11..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import Foundation

struct StoryboardName {
    static let main = "Main"
    static let launchScreen = "LaunchScreen"
    static let dashboard = "Dashboard"
    static let settings = "Settings"
    
    static let settingsStoryboards: [[String]] = [
        ["SettingName", "SettingGender", "SettingBirthDate", "SettingStartDate", "HealthInfo"],
        ["SettingAlarm", "SettingCigaretteDaily", "SettingCigarettePrice"],
        ["SettingVersion"]
    ]
}
