//
//  HistoryViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import RealmSwift

class HistoryViewController: UIViewController {
    
    var historyArray: Results<MainList>?
    var foodList = FoodList()
    let realm = try! Realm()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
        loadhistory()
    }
    
    func loadhistory() {
        historyArray = realm.objects(MainList.self).filter("done == true")
        tableView.reloadData()
    }
   
}
