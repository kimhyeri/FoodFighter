//
//  ViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var historyArray : Results<MainList>?
    var listArray : Results<MainList>?
    var foodList = FoodList()
    
    let realm = try! Realm()
    let calender = NSCalendar.current
    let defaults = UserDefaults.standard

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadList()
        setNaigationBackButton()
        
    }
    
    @IBAction func historyButton(_ sender: Any) {
        let st = UIStoryboard.init(name: "History", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "going") as! HistoryViewController
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
            setDefaultView()
        }
        self.tableView.reloadData()
    }
    
    func loadhistory () -> Results<MainList>{
        historyArray = realm.objects(MainList.self).filter("done == true")
        return historyArray!
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

