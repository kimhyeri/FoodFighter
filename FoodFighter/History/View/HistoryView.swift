//
//  HistoryView.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 9. 21..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import RealmSwift

//MARK: TableView delegate and datasource
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHist", for: indexPath) as! MainListTableViewCell
        guard let img = historyArray?[indexPath.row].image else { return cell }
        cell.titleView.layer.cornerRadius = 5
        cell.thumImage.image = UIImage(named: foodList.images[img].0)
        cell.descript.text = historyArray? [indexPath.row].descript
        cell.title.text = historyArray? [indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            do{
                try self.realm.write {
                    print(indexPath.row)
                    self.realm.delete(self.historyArray![indexPath.row])
                    loadhistory()
                }
            } catch {
                print("error")
            }
        }
    }
    
}

//MARK: SET VIEW
extension HistoryViewController {
    func setTitle() {
        self.navigationItem.title = "푸드파이터 전적"
    }
}
