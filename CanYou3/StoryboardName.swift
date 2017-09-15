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
    static let badge = "Badge"
    static let reward = "Reward"
    
    
    // MARK : - Settings
    static let settings = "Settings"
    static let settingsName = "SettingName"
    static let settingsGender = "SettingGender"
    static let settingsBirthDate = "SettingBirthDate"
    static let settingsStartDate = "SettingStartDate"
    static let healthInfo = "HealthInfo"
    static let settingsAlarm = "SettingAlarm"
    static let settingsCigaretteDaily = "SettingCigaretteDaily"
    static let settingsCigarettePrice = "SettingCigarettePrice"
    static let settingsVersion = "SettingVersion"
    
    static var settingsStoryboards: [[String]] {
        get {
            return
                [
                    [self.settingsName, self.settingsGender, self.settingsBirthDate, self.settingsStartDate, self.healthInfo],
                    [self.settingsAlarm, self.settingsCigaretteDaily, self.settingsCigarettePrice],
                    [self.settingsVersion]
                ]
        }
    }
}
