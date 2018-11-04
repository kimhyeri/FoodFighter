//
//  HistoryView.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 9. 21..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit


extension HistoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = historyArray?.count {
            return count
        } else {
          return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHist", for: indexPath) as! MainListTableViewCell
        cell.titleView.layer.cornerRadius = 5
        if let img = historyArray?[indexPath.row].image {
            cell.thumImage.image = UIImage(named: foodList.images[img].0)
        }
        cell.descript.text = historyArray? [indexPath.row].descript
        cell.title.text = historyArray? [indexPath.row].title

        return cell
        
    }
    
    func setTitle() {
        self.navigationItem.title = "푸드파이터 전적"
    }
}
