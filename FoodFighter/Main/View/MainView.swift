//
//  MainView.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 9. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

extension ViewController {
    func setDefaultView(){
        let nothingView = UIView()
        nothingView.backgroundColor = .clear
        nothingView.frame = CGRect(x: 0, y: self.view.frame.height / 3, width: self.view.frame.width, height: self.view.frame.height / 2)
        view.addSubview(nothingView)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foodfighter")
        imageView.frame = CGRect(x: (view.frame.width - 150) / 2 , y: 0, width: 150, height: 150)
        nothingView.addSubview(imageView)
        
        let label = UILabel()
        label.text = "푸드파이터의 일정을 등록하세요 !"
        label.textColor = UIColor.darkGray
        label.sizeToFit()
        label.textAlignment = .center
        label.frame = CGRect(x: (view.frame.width - 300) / 2, y: 0 , width: 300, height: 20)
        nothingView.addSubview(label)
    }
}


//MARK: manage tableView
extension ViewController : UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showAlertController(style:. actionSheet)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = listArray?.count {
            return count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainListTableViewCell
        
        if let img = listArray?[indexPath.row].image {
            cell.thumImage.image = UIImage(named: foodList.images[img].0)
        }
        cell.descript.text = listArray? [indexPath.row].descript
        cell.title.text = listArray? [indexPath.row].title
        
        if let value = listArray?[indexPath.row].createdTime {
            if dateCal(date: value) < 0 {
                cell.dDay.text = "끝"
            } else {
                cell.dDay.text = "D-\(dateCal(date: value))"
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            do{
                try self.realm.write {
                    self.realm.delete(self.listArray![indexPath.row])
                    loadList()
                }
            }catch {
                print("error")
            }
        }
    }
}

