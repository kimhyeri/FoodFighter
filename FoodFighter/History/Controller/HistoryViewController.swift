//
//  HistoryViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 30..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import RealmSwift

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private let realm = try! Realm()
    private var historyArray: Results<MainList>?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviagationTitle()
        loadHistoryList()
    }
    
    private func loadHistoryList() {
        historyArray = realm.objects(MainList.self).filter("done == true")
        if let history = historyArray, history.isEmpty {
            setDefaultView(messgae: "푸드파이터의 기록을 남겨주세요 !") 
        }
        tableView.reloadData()
    }
    
    private func setNaviagationTitle() {
        self.navigationItem.title = "푸드파이터 전적"
    }
}

//MARK: TableView delegate and datasource
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainListTableViewCell.reuseIdentifier,
            for: indexPath) as? MainListTableViewCell
            else { return UITableViewCell() 
        }
        guard let img = historyArray?[indexPath.row].imageString else { return cell }
        cell.roundCorners(layer: cell.titleView.layer, radius: 5)
        cell.thumImage.image = UIImage(named: img)
        cell.descript.text = historyArray? [indexPath.row].descript
        cell.title.text = historyArray? [indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            do{
                try self.realm.write {
                    self.realm.delete(self.historyArray![indexPath.row])
                    loadHistoryList()
                }
            } catch {
                print("error")
            }
        }
    }
}
