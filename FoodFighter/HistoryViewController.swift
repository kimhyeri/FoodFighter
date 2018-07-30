//
//  HistoryViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var historyArray : Results<MainList>?
    var foodList = FoodList()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (historyArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHist", for: indexPath) as! MainListTableViewCell
        cell.thumImage?.image = UIImage(named: foodList.images[(historyArray? [indexPath.row].image)!].0)
        cell.descript.text = historyArray? [indexPath.row].descript
        cell.title.text = historyArray? [indexPath.row].title
        return cell
        
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        addStatusBar()
        self.navigationItem.title = "푸드파이터 전적"

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
