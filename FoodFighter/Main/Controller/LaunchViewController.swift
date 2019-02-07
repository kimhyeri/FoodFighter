//
//  LaunchViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import RevealingSplashView

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        animation()
    }
    
    //MARK: splash view animation
    private func animation(){
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "foodfighter")!,iconInitialSize: CGSize(width: 150, height: 150), backgroundColor: UIColor(hexString: "#FFFFFF"))
        self.view.addSubview(revealingSplashView)
        
        revealingSplashView.startAnimation(){
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "start") else { return }
            self.present(vc, animated: false, completion: nil)
        }
    }
    
}

