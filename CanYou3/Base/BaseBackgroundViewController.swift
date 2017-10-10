//
//  BaseBackgroundViewController.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 11..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class BaseBackgroundViewController: BaseViewController {
    // MARK : Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK : Methods for Background
    override func addBackgroundView() {
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
        //self.addBackgroundView()
    }
}
