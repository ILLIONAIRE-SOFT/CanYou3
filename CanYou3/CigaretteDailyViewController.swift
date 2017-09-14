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
    
    @IBAction func startTapped(_ sender: UIButton) {
        let text: String = cigaretteDaily.text ?? ""
        if text.isEmpty {
            presentMessageBox("Input numbers !")
            return
        }
        if Int(text)! <= 0 {
            presentMessageBox("Must be bigger than 0 !")
            return
        }
        dc.currentUser.cigaretteDaily = Int16(text)!
        dc.currentUser.startDate = NSDate()
        dc.saveContext()
        
        let vc = viewController(forStoryboardName: StoryboardName.dashboard)
        
        present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
