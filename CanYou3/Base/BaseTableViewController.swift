//
//  BaseTableViewController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    // dataController
//    lazy var dc = (UIApplication.shared.delegate as! AppDelegate).dataController
    var hideNavigationBar: Bool = false
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK : - View Life Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomLayoutGuide.length, right: 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //super.tableView(tableView, didSelectRowAt: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK : Methods for Keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK : - Animation
    func popViewControllerWith(transition: CATransition){
        if let nc = self.navigationController {
            nc.view.layer.add(transition, forKey: nil)
            nc.popViewController(animated: false)
        }
    }
}

// MARK: - Hide NavigationBar only for this ViewController
extension BaseTableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.hideKeyboardWhenTappedAround()
        if let navigationController = self.navigationController {
            if !hideNavigationBar {
                navigationController.setNavigationBarHidden(false, animated: animated)
            } else {
                // Hide the navigation bar on the this view controller
                navigationController.setNavigationBarHidden(true, animated: animated)
            }
        }
    }
}
