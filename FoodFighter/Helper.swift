//
//  Helper.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func addStatusBar(){
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20)
       
        statusBar.backgroundColor = UIColor(hexString: "#FFD4B7")
    }
    
    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
}
