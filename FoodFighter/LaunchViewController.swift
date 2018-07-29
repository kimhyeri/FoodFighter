//
//  LaunchViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RevealingSplashView

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "foodfighter")!,iconInitialSize: CGSize(width: 150, height: 150), backgroundColor: UIColor.white)
        self.view.addSubview(revealingSplashView)
        
        revealingSplashView.startAnimation(){
            print("Completed")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "start")
            self.present(vc!, animated: false, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
