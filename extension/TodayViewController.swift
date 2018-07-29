//
//  TodayViewController.swift
//  extension
//
//  Created by hyerikim on 2018. 7. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var dDay: UILabel!
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let defaults = UserDefaults.standard

    override func viewDidAppear(_ animated: Bool) {
        imageView.image = UIImage(named: "image0")
        restName.text = "위젯을 등록하세요"
        dDay.text = "FoodFighter"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let title = defaults.string(forKey: "widgetTitle")!
            print("hehe")
            restName.text = title as String
        let image = defaults.string(forKey: "widgetImage")!
            imageView.image = UIImage(named: image as String)
        let getDay = defaults.string(forKey: "widgetDday")!
            dDay.text = getDay as String

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
