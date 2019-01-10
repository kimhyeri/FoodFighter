//
//  BackView.swift
//  FoodFighter
//
//  Created by hyerikim on 10/01/2019.
//  Copyright © 2019 hyerikim. All rights reserved.
//

import UIKit

extension UIViewController {
    func setDefaultView(messgae: String) {
        let nothingView = UIView()
        nothingView.backgroundColor = .clear
        nothingView.frame = CGRect(x: 0, y: self.view.frame.height / 3, width: self.view.frame.width, height: self.view.frame.height / 2)
        view.addSubview(nothingView)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foodfighter")
        imageView.frame = CGRect(x: (view.frame.width - 150) / 2 , y: 0, width: 150, height: 150)
        nothingView.addSubview(imageView)
        
        let label = UILabel()
        label.text = "\(messgae)"
        label.textColor = UIColor.darkGray
        label.sizeToFit()
        label.textAlignment = .center
        label.frame = CGRect(x: (view.frame.width - 300) / 2, y: 0 , width: 300, height: 20)
        nothingView.addSubview(label)
    }
}
