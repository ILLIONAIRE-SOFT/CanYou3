//
//  BadgeTableViewCell.swift
//  CanYou3
//
//  Created by Macbook Pro on 2017. 9. 15..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//


import UIKit

class BadgeTableViewCell: UITableViewCell {
    @IBOutlet var badgeImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

