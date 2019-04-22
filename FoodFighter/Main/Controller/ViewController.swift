//
//  ViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var listArray: Results<MainList>?
    private let cellId = "Cell"
    private let defaults = UserDefaults.standard
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoodList()
        setNaigationBackButton()
        self.navigationItem.title = "푸트파이터 일정"
    }
    
    @IBAction func historyButton(_ sender: Any) {
        let st = UIStoryboard.init(name: "History", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "going") as! HistoryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func dateCal(date: Date) -> Int {
        let calender = NSCalendar.current
        let now = Date()
        let date1 = calender.startOfDay(for: now)
        let date2 = calender.startOfDay(for: date)
        let components = calender.dateComponents([.day], from: date1, to: date2)
        return components.day ?? 0
    }
    
    private func loadFoodList() {
        listArray = realm.objects(MainList.self).filter("done == false")
        if let list = listArray, list.isEmpty {
            setDefaultView(messgae: "푸드파이터의 일정을 등록하세요 !")
        }
        self.tableView.reloadData()
    }
    
    func showAlertController(style: UIAlertControllerStyle){
        let alertController: UIAlertController
        alertController = UIAlertController(title: "푸드파이터",
                                            message: "음식을 드셨나요?", 
                                            preferredStyle: style
        )
        
        let noAction: UIAlertAction
        noAction = UIAlertAction(title: "아니요 😂",
                                 style: .cancel,
                                 handler: {[weak self] (action: UIAlertAction) in
            guard let self = self else { return }
            self.showToast(message: "얼른 도전하세요")
        })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "네 😇",
                                     style: .default, 
                                     handler: {[weak self]( action: UIAlertAction) in
            guard let self = self else { return }
            if let indexPath = self.tableView.indexPathForSelectedRow,
                let item = self.listArray?[indexPath.row] {
                do {
                    try self.realm.write {
                        item.done = true
                        self.loadFoodList()
                        self.showToast(message: "진정한 푸드파이터 입니다")
                    }
                } catch {
                    print("Error")
                }
                
            }
        })
        alertController.addAction(noAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showAlertController(style:. actionSheet)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MainListTableViewCell else { return UITableViewCell() }
        guard let img = listArray?[indexPath.row].imageString, 
            let timeValue = listArray?[indexPath.row].createdTime
            else { return cell }  
        cell.thumImage.image = UIImage(named: img)
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
                    loadFoodList()
                }
            } catch {
                print("error")
            }
        }
    }
}

