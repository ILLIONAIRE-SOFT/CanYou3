//
//  BaseViewController.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 11..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit
import UserNotifications
import WatchConnectivity
import Hero
import Then

class BaseViewController: UIViewController {
    // let realm = try! Realm()
    // var currentUser = DataController.shared.currentUser
    var dc = DataController.shared
    
    // MARK : Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK : Methods for Background
    func addBackgroundView() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "Gradation")
        
        // change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
    }
    
    // MARK : ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideKeyboardWhenTappedAround()
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
    
    // MARK : Alert suppoert
    func presentMessageBox(_ message: String) {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        sheet.message = message
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        sheet.addAction(okAction)
        self.present(sheet, animated: true, completion: nil)
    }
}

extension BaseViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Tapped in notification")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("Notification being triggered")
        completionHandler( [.alert,.sound,.badge])
    }
}



