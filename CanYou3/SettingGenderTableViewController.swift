//
//  SettingGenderTableViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//


import UIKit

class SettingGenderTableViewController: BaseTableViewController {
    // MARK : - Properties
    @IBOutlet var maleCell: UITableViewCell!
    @IBOutlet var femaleCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCheckmark()
    }
    
    func setCheckmark() {
        switch dc.currentUser.gender! {
        case "Male":
            maleCell.accessoryType = .checkmark
            femaleCell.accessoryType = .none
        case "Female":
            maleCell.accessoryType = .none
            femaleCell.accessoryType = .checkmark
        default:
            maleCell.accessoryType = .checkmark
            femaleCell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        
        switch indexPath.row {
        case 0:
            dc.currentUser.gender = "Male"
        case 1:
            dc.currentUser.gender = "Female"
        default:
            break
        }
        
        dc.saveContext()
        setCheckmark()
    }
}
