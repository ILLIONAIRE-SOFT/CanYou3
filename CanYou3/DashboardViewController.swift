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
//        let storyboard = UIStoryboard(name: "Setting", bundle: Bundle.main)
//        let vc = storyboard.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        let vc = viewController(forStoryboardName: "Settings") as! SettingsTableViewController
        
        let navigationController = self.navigationController
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: vc, action: #selector(vc.closeButtonTapped(_:)))
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: vc, action: nil)
        
        let transition = AnimationController.popUpTransition
        
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK: - Hide NavigationBar only for this ViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navigationController = self.navigationController {
            // Hide the navigation bar on the this view controller
            navigationController.setNavigationBarHidden(true, animated: animated)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let navigationController = self.navigationController {
            // Show the navigation bar on other view controllers
            navigationController.setNavigationBarHidden(false, animated: animated)
        }
    }
}
