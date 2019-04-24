//
//  Reusable.swift
//  FoodFighter
//
//  Created by hyeri kim on 24/04/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

protocol Reusable: class {}

extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return "Cell"
    }
}
