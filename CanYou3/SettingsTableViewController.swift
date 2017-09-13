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
    @IBOutlet var birthLabel: UILabel!
    @IBOutlet var startdateLabel: UILabel!
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var alarmLabel: UILabel!
    @IBOutlet var cigaretteDailyLabel: UILabel!
    @IBOutlet var cigarettePriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomLayoutGuide.length, right: 0)
//        tableView.scrollIndicatorInsets = tableView.contentInset
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item < storyboards[indexPath.section].count {
            let storyboardName = storyboards[indexPath.section][indexPath.item]
            let vc = viewController(forStoryboardName: storyboardName)
            
            // iOS bug: https://github.com/lkzhao/Hero/issues/106 https://github.com/lkzhao/Hero/issues/79
            DispatchQueue.main.async {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        nameLabel.text = currentUser.name
//        genderLabel.text = currentUser.gender
//        birthLabel.text = dataController.dateFormatter.string(from: currentUser.birth)
//        startdateLabel.text = dataController.dateFormatter.string(from: currentUser.startDate)
//        versionLabel.text = dataController.version
//        if currentUser.alarm {
//            alarmLabel.text = "On"
//        } else {
//            alarmLabel.text = "Off"
//        }
//        cigaretteDailyLabel.text = String(currentUser.cigaretteDaily)
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//        cigarettePriceLabel.text = numberFormatter.string(from: NSNumber(value:currentUser.cigarettePrice))!
//    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        let transition = AnimationController.popDownTransition
        self.closeWith(transition: transition)
    }
    
    func closeWith(transition: CATransition){
        if let nc = self.navigationController {
            nc.view.layer.add(transition, forKey: nil)
            nc.popViewController(animated: false)
        }
    }
}
