//
//  Extension+UIView.swift
//  FoodFighter
//
//  Created by hyeri kim on 08/02/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(layer targetLayer: CALayer, radius withRaidus: CGFloat) {
        targetLayer.cornerRadius = withRaidus
        targetLayer.masksToBounds = true
    }
}
