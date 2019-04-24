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
    
    func config(category: Category, data: MainList) {
        switch category {
        case .history:
            self.roundCorners(layer: self.titleView.layer, radius: 5)
            self.thumImage.image = UIImage(named: data.imageString)
            self.descript.text = data.descript
            self.title.text = data.title
        case .main:
            guard let time = data.createdTime else { return }
            self.thumImage.image = UIImage(named: data.imageString)
            self.descript.text = data.descript
            self.title.text = data.title
            if dateCal(date: time) < 0 {
                self.dDay.text = "끝"
            } else {
                self.dDay.text = "D-\(dateCal(date: time))"
            }
        }
    }
    
    private func dateCal(date: Date) -> Int {
        let calender = NSCalendar.current
        let now = Date()
        let date1 = calender.startOfDay(for: now)
        let date2 = calender.startOfDay(for: date)
        let components = calender.dateComponents([.day], from: date1, to: date2)
        return components.day ?? 0
    }
}

extension MainListTableViewCell: Reusable {}
