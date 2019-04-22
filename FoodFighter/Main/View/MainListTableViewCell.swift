//
//  MainListTableViewCell.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Realm

class MainListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var dDay: UILabel!
    @IBOutlet weak var thumImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descript: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
