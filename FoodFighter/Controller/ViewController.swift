//
//  ViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var historyArray : Results<MainList>?
    var listArray : Results<MainList>?
    var foodList = FoodList()
    
    let realm = try! Realm()
    let calender = NSCalendar.current
    let defaults = UserDefaults.standard

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStatusBar()
        tableView.delegate = self
        tableView.dataSource = self
        loadList()
        setNaigationBackButton()
        
    }
    
    @IBAction func historyButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "going") as! HistoryViewController
        vc.historyArray = loadhistory()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func dateCal(date: Date) -> Int{
        let now = Date()
        let date1 = calender.startOfDay(for: now)
        let date2 = calender.startOfDay(for: date)
        let components = calender.dateComponents([.day], from: date1, to: date2)
        return components.day!
    }
    
    func loadList () {
        listArray = realm.objects(MainList.self).filter("done == false")
        
        if listArray?.count == 0 {
            check()
        }
        self.tableView.reloadData()
    }
    
    func loadhistory () -> Results<MainList>{
        historyArray = realm.objects(MainList.self).filter("done == true")
        return historyArray!
    }
    
    func check(){
        let nothingView = UIView()
        nothingView.backgroundColor = .clear
        nothingView.frame = CGRect(x: 0, y: self.view.frame.height / 3, width: self.view.frame.width, height: self.view.frame.height / 2)
        view.addSubview(nothingView)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foodfighter")
        imageView.frame = CGRect(x: (view.frame.width - 150) / 2 , y: 0, width: 150, height: 150)
        nothingView.addSubview(imageView)
        
        let label = UILabel()
        label.text = "푸드파이터의 일정을 등록하세요 😛"
        label.sizeToFit()
        label.textAlignment = .center
        label.frame = CGRect(x: (view.frame.width - 300) / 2, y: 0 , width: 300, height: 20)
        nothingView.addSubview(label)
    }
    
    func showAlertController(style: UIAlertControllerStyle){
        
        let alertController: UIAlertController
        alertController = UIAlertController(title: "푸드파이터", message: "음식을 드셨나요?", preferredStyle: style)
 
        let noAction: UIAlertAction
        noAction = UIAlertAction(title: "아니요 😂", style: .cancel, handler: {(
            action: UIAlertAction) in
                self.showToast(message: "얼른 도전하세요")
            }
        )
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "네 😇", style: .default, handler: {(
            action: UIAlertAction) in
            if let indexPath = self.tableView.indexPathForSelectedRow {
                if let item = self.listArray?[indexPath.row] {
                    do {
                        try self.realm.write {
                            item.done = true
                            self.loadList()
                            self.showToast(message: "진정한 푸드파이터 입니다")
                        }
                    }catch {
                        print("Error")
                    }
                }
            }
        })
        
        alertController.addAction(noAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

//MARK: manage tableView
extension ViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showAlertController(style:. actionSheet)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainListTableViewCell
        
        cell.thumImage?.image = UIImage(named: foodList.images[(listArray? [indexPath.row].image)!].0)
        cell.descript.text = listArray? [indexPath.row].descript
        cell.title.text = listArray? [indexPath.row].title
        cell.dDay.text = "D-\(dateCal(date: (listArray?[indexPath.row].createdTime)!))"
        
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
