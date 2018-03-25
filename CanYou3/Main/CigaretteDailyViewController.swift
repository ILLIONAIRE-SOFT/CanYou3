//
//  CigaretteDailyViewController.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class CigaretteDailyViewController: BaseBackgroundViewController {
    // MARK : - Properties
    @IBOutlet var cigaretteDaily: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    @IBAction func startTapped(_ sender: UIButton){
//        let storyboard = UIStoryboard(name: StoryboardName.main, bundle: Bundle.main)
//        let vc = storyboard.instantiateViewController(withIdentifier: ViewControllerName.welcome)
//        
//        vc.heroModalAnimationType = .zoom
//        self.hero_replaceViewController(with: vc)
//    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        guard let text = cigaretteDaily.text, let value = Int16(text) else {
            presentMessageBox("Input numbers only !")
            return
        }
        if value <= 0 {
            presentMessageBox("Must be bigger than 0 !")
            return
        }
        dc.currentUser.cigaretteDaily = value
        dc.currentUser.startDate = NSDate()
        dc.currentUser.isFirst = false
        dc.currentUser.isFirst = true
        dc.initData()
        dc.saveContext()
        
        let vc = viewController(forStoryboardName: StoryboardName.dashboard)
        
        self.hero.replaceViewController(with: vc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
