//
//  AnimationController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

struct AnimationController {
    static var popUpTransition: CATransition {
        return CATransition().then{
            $0.duration = 0.5
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            $0.type = kCATransitionMoveIn
            $0.subtype = kCATransitionFromTop
        }
    }
    static var popDownTransition: CATransition {
        return CATransition().then{
            $0.duration = 0.5
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            $0.type = kCATransitionReveal
            $0.subtype = kCATransitionFromBottom
        }
    }
}
