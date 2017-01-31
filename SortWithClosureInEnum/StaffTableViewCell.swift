//
//  StaffTableViewCell.swift
//  SortWithClosureInEnum
//
//  Created by Yoshikuni Kato on 2016/04/06.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

class StaffTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var staffIdLabel: UILabel!
    @IBOutlet weak var staffCardIdLabel: UILabel!
    
    func configure(name: String, staffId: String, staffCardId: String) {
        nameLabel.text = name
        staffIdLabel.text = staffId
        staffCardIdLabel.text = staffCardId
    }
    
}
