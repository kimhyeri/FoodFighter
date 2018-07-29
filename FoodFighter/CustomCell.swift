//
//  CustomCell.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit
import FoldingCell

class CustomCell: UITalbeViewCell ,FoldingCell {
    
    @IBInspectable var itemCount: NSInteger
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var foregroundViewTop: NSLayoutConstraint!
    @IBOutlet weak var foregroundView: RotatedView!
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
}
