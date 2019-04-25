//
//  Helper.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

extension UIViewController{
    static let backbutton = "backButton"

    func setNavigationBarTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func setNaigationBackButton(){
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: UIViewController.backbutton)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: UIViewController.backbutton)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    func showToast(message : String) {
        let toastFrame = CGRect(x: self.view.frame.size.width/2 - 125,
                           y:  self.view.frame.size.height - 100,
                           width: 250,
                           height: 35
        )
        let toastLabel = UILabel(frame: toastFrame)
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "System", size: 10.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
