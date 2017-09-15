//
//  WelcomeViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseBackgroundViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextTapped(_ sender: UIButton){
        let storyboard = UIStoryboard(name: StoryboardName.main, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: ViewControllerName.cigaretteDaily) as! CigaretteDailyViewController
        
        vc.heroModalAnimationType = .pageIn(direction: .left)
        self.hero_replaceViewController(with: vc)
//        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    // MARK : Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
