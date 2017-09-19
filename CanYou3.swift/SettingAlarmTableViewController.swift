//
//  SettingAlarmTableViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class SettingAlarmTableViewController: BaseTableViewController {
    // MARK : - Properties
    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var randomAlarmSwitch: UISwitch!
    
//    let notificationController = NotificationController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        randomAlarmSwitch.isOn = dc.currentUser.randomAlarm
        alarmSwitch.isOn = dc.currentUser.alarm
    }
    
    @IBAction func alarmSwitchValueChanged(_ sender: UISwitch) {
        // alarm on, off
        switch sender.isOn {
        case true:
            randomAlarmSwitch.isEnabled = true
            // alarm on!
            // notificationController.updateNotifications()
        case false:
            randomAlarmSwitch.isEnabled = false
            // all alarm off !
            // notificationController.removeAllScheduledNotification()
        }
        
        dc.currentUser.alarm = sender.isOn
    }
    
    @IBAction func randomAlarmSwitchValueChanged(_ sender: UISwitch) {
//        // random alarm on, off
//        switch sender.isOn {
//        case true:
//            // random alarm on!
//            notificationController.updateNotifications()
//        case false:
//            // random alarm off !
//            notificationController.removeAllScheduledNotification()
//        }
        
        dc.currentUser.randomAlarm = sender.isOn
    }
}
