//
//  GeneralMethod.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

func viewController(forStoryboardName: String) -> UIViewController {
    return UIStoryboard(name: forStoryboardName, bundle: nil).instantiateInitialViewController()!
}
