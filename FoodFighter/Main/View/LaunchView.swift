//
//  LaunchView.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 9. 21..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RevealingSplashView

extension LaunchViewController {
   
    func animation(){
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "foodfighter")!,iconInitialSize: CGSize(width: 150, height: 150), backgroundColor: UIColor(hexString: "#FFFFFF"))
        self.view.addSubview(revealingSplashView)
        
        revealingSplashView.startAnimation(){
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "start"){
                self.present(vc, animated: false, completion: nil)
            }
        }
    }
    
}
