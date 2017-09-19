//
//  BaseStore.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class BaseStore {
    static let dc = (UIApplication.shared.delegate as! AppDelegate).dataController
    static var currentUser: User {
        return self.dc.currentUser
    }
}
