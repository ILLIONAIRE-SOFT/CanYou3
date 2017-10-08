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
    
    @IBOutlet var terryImageView: UIImageView!
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var progressView: GTProgressBar!
    
    @IBOutlet var savedMoneyView: UIView!
    @IBOutlet var savedMoneyLabel: UILabel!
    
    @IBOutlet var savedCigView: UIView!
    @IBOutlet var savedCigLabel: UILabel!
    
    // Badge
    @IBOutlet var badgeImageView: UIImageView!
    @IBOutlet var badgeButton: UIButton!
    @IBOutlet var badgeView: UIView!
    
    // Reward
    @IBOutlet var rewardImageView: UIImageView!
    @IBOutlet var rewardButton: UIButton!
    @IBOutlet var rewardView: UIView!
    
//    @IBOutlet var view1: UIView!
//    @IBOutlet var view2: UIView!
    
    var timer: Timer?
    
    // Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.hideNavigationBar = true
    }
    
    // Present SettingTableView with Custom animation
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        // push view controller but animate modally
        let vc = viewController(forStoryboardName: StoryboardName.settings)
        vc.heroModalAnimationType = .selectBy(presenting:.cover(direction:.up), dismissing:.uncover(direction:.down))
        if let nc = self.navigationController{
//            nc.addChildViewController(vc)
            nc.pushViewController(vc, animated: false)
        }
        
        
//        DispatchQueue.main.async {
//            self.present(vc, animated: true, completion: nil)
//        }
    }
    
    // MARK: Button Actions
    @IBAction func rewardButtonTapped(_ sender: UIButton) {
        let vc = viewController(forStoryboardName: StoryboardName.reward) as! RewardViewController
        
        vc.heroModalAnimationType = .fade
        
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func badgeButtonTapped(_ sender: UIButton) {
        let vc = viewController(forStoryboardName: StoryboardName.badge) as! BadgeViewController
        
        vc.heroModalAnimationType = .fade
        
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func healthInfoTapped(_ sender: UIGestureRecognizer) {
        let vc = viewController(forStoryboardName: StoryboardName.healthInfo)
        
        vc.heroModalAnimationType = .fade
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        setColors()
//        view1.heroModifiers = [.fade, .translate(y:20)]
//        view2.heroModifiers = [.fade, .translate(y:20)]
        badgeView.heroModifiers = [.fade, .translate(y:20)]
        rewardView.heroModifiers = [.fade, .translate(y:20)]
    }
    
    // Color
    func setColors(){
        self.badgeView.backgroundColor = Color.badge
        self.rewardView.backgroundColor = Color.reward
    }
    
    // Timer
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
