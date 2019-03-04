//
//  MainView.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 9. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

//MARK: manage tableView
extension ViewController : UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showAlertController(style:. actionSheet)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MainListTableViewCell else { return UITableViewCell() }
        guard let img = listArray?[indexPath.row].image else { return cell }
        guard let timeValue = listArray?[indexPath.row].createdTime else { return cell }        
        cell.thumImage.image = UIImage(named: foodList.images[img].0)
        cell.descript.text = listArray? [indexPath.row].descript
        cell.title.text = listArray? [indexPath.row].title
        if dateCal(date: timeValue) < 0 {
            cell.dDay.text = "끝"
            return cell
        }
        cell.dDay.text = "D-\(dateCal(date: timeValue))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            do{
                try self.realm.write {
                    self.realm.delete(self.listArray![indexPath.row])
                    loadList()
                }
            } catch {
                print("error")
            }
        }
    }
}

