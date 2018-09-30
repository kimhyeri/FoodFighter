 //
//  CustomNaviController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class CustomNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultNavi()
    }
    
    func defaultNavi() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.backgroundColor = UIColor(hexString: "#FFAA64")
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.tintColor = .darkGray
    }
}
