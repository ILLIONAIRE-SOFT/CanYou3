//
//  UIViewControllerExtension.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 19..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit
import Hero

extension UIViewController {
    var dc: DataController{
        return (UIApplication.shared.delegate as! AppDelegate).dataController
    }
    var currentUser: User {
        return self.dc.currentUser
    }
}
