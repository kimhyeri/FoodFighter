//
//  HistoryViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController {
    
    var historyArray : Results<MainList>?
    var foodList = FoodList()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        addStatusBar()
        setTitle()
        
    }
   
}
