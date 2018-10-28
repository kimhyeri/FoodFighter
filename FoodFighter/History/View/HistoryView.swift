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
        return (historyArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHist", for: indexPath) as! MainListTableViewCell
        cell.thumImage?.image = UIImage(named: foodList.images[(historyArray? [indexPath.row].image)!].0)
        cell.descript.text = historyArray? [indexPath.row].descript
        cell.title.text = historyArray? [indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "AR") as! ARViewController
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    func setTitle() {
        self.navigationItem.title = "푸드파이터 전적"
    }
}
