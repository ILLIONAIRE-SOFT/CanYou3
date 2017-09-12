//
//  DashboardViewController.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 11..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class DashboardViewController: BaseBackgroundViewController {
    
    // Present SettingTableView with Custom animation
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        // push view controller but animate modally
        let vc = viewController(forStoryboardName: StoryboardName.settings)
        let transition = AnimationController.popUpTransition
        self.openWith(transition: transition, viewController: vc)
    }
}
