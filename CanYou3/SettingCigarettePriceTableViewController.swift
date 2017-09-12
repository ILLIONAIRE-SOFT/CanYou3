//
//  SettingCigarettePriceTableViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//
import UIKit

class SettingCigarettePriceTableViewController: BaseTableViewController {
    // MARK : - Properties
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        textField.placeholder = String(currentUser.cigarettePrice)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem){
//        if let value = Int(textField.text ?? "0") {
//            currentUser.cigarettePrice = value
//        }
    }
}
