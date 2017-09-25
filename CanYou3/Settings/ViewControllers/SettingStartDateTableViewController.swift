//
//  SettingStartDateTableViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class SettingStartDateTableViewController: BaseTableViewController {
    // MARK : - Properties
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let date = dc.currentUser.startDate {
            datePicker.date = date as Date
        }
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        dc.currentUser.startDate = datePicker.date as NSDate
        dc.saveContext()
        self.navigationController?.popViewController(animated: true)
    }
}
