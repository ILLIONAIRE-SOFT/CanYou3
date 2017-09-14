//
//  SettingsTableViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class SettingsTableViewController: BaseTableViewController {

    let storyboards = StoryboardName.settingsStoryboards
    
    // MARK : - Properties
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthDateLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var alarmLabel: UILabel!
    @IBOutlet var cigaretteDailyLabel: UILabel!
    @IBOutlet var cigarettePriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item < storyboards[indexPath.section].count {
            let storyboardName = storyboards[indexPath.section][indexPath.item]
            let vc = viewController(forStoryboardName: storyboardName)
            
            // iOS bug: https://github.com/lkzhao/Hero/issues/106 https://github.com/lkzhao/Hero/issues/79
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameLabel.text = dc.currentUser.name
        genderLabel.text = dc.currentUser.gender
        startDateLabel.text = Formatter.string(fromDate: dc.currentUser.startDate!)
        birthDateLabel.text = Formatter.string(fromDate: dc.currentUser.birthDate!)
        versionLabel.text = Versions.latest.version
        if dc.currentUser.alarm {
            alarmLabel.text = "On"
        } else {
            alarmLabel.text = "Off"
        }
        cigaretteDailyLabel.text = String(dc.currentUser.cigaretteDaily)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        cigarettePriceLabel.text = numberFormatter.string(from: NSNumber(value: dc.currentUser.cigarettePrice))!
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        let transition = AnimationController.popDownTransition
        self.closeWith(transition: transition)
    }
}
