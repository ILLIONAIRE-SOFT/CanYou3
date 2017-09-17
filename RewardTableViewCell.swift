//
//  RewardTableViewCell.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 17..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit

class RewardTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var cansLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
