//
//  HealthInfoTableViewCell.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 16..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class HealthInfoTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
