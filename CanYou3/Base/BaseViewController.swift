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
    // DataController
    //    lazy var dc = (UIApplication.shared.delegate as! AppDelegate).dataController
    //    var currentUser: User {
    //        return dc.currentUser
    //    }
    var hideNavigationBar: Bool = false
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hero.navigationAnimationType = .auto
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
    
    // MARK : Alert support
    func presentMessageBox(_ message: String) {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        sheet.message = message
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        sheet.addAction(okAction)
        self.present(sheet, animated: true, completion: nil)
    }
    
    // MARK : Animation
    func pushViewControllerWith(transition: CATransition, viewController: UIViewController){
        if let nc = self.navigationController {
            nc.view.layer.add(transition, forKey: nil)
            nc.pushViewController(viewController, animated: false)
        }
    }
}

// NotificationDeleagte
extension BaseViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Tapped in notification")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("Notification being triggered")
        completionHandler( [.alert,.sound,.badge])
    }
}

// MARK: - Hide NavigationBar only for this ViewController
extension BaseViewController {
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if !hideNavigationBar { return }
        //        if let navigationController = self.navigationController {
        //            // Show the navigation bar on other view controllers
        //            navigationController.setNavigationBarHidden(false, animated: animated)
        //        }
    }
}
