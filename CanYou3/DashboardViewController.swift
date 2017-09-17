//
//  DashboardViewController.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 11..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit
import Hero
import GTProgressBar

class DashboardViewController: BaseBackgroundViewController {
    // MARK : - Properties
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var progressView: GTProgressBar!
    
    @IBOutlet var savedMoneyView: UIView!
    @IBOutlet var savedMoneyLabel: UILabel!
    
    @IBOutlet var savedCigView: UIView!
    @IBOutlet var savedCigLabel: UILabel!
    
    var timer: Timer?
    
    // Present SettingTableView with Custom animation
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        // push view controller but animate modally
        let vc = viewController(forStoryboardName: StoryboardName.settings)
        vc.heroModalAnimationType = .cover(direction: .up)
        
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: Button Actions
    @IBAction func rewardButtonTapped(_ sender: UIButton) {
        let vc = viewController(forStoryboardName: StoryboardName.reward)
        
        vc.heroModalAnimationType = .fade
        
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func badgeButtonTapped(_ sender: UIButton) {
        let vc = viewController(forStoryboardName: StoryboardName.badge)
        
        vc.heroModalAnimationType = .fade
        
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
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
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
    }
    
    @objc func updateLabels() {
        if let item = dc.lastHealthInfo {
            var percent: CGFloat = CGFloat(currentUser.timeInterval / item.time)
            if percent > 1.0 {
                percent = 1.0
            }
            progressView.progress = percent
            contentLabel.text = item.name
        }
        
        dayLabel.text = String(format: "%d", dc.computer.day)
        timeLabel.text = String(format: "%02d : %02d : %02d", dc.computer.hours, dc.computer.minutes, dc.computer.seconds)
        //        savedMoneyLabel.text = Formatter.string(fromNumber: NSNumber(value:currentUser.savedMoney)) + " 원"
        //        savedCigLabel.text = "\(currentUser.savedCigarette) 개비"
        
    }
}
