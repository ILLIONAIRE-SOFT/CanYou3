//
//  CanYouAnimation.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 11..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class CanYouAnimationViewController: BaseViewController {
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4, execute: {
            self.label.fadeTransition(for: 1.2)
            self.label.text = "You Can !"
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.7, execute: {
            // Load Storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            // Instantiate View Controller
            var viewController: UIViewController!
//            if dataController.currentUser.isNew {
//                viewController = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
//            } else {
//                viewController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
//            }
            
            viewController.modalTransitionStyle = .crossDissolve
            
            self.present(viewController, animated: true, completion: nil)
        })
        
    }
    
    // MARK : Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
