//
//  ViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    var listArray : Results<MainList>?
    var foodList = FoodList()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainListTableViewCell
        cell.thumImage?.image = UIImage(named: foodList.images[(listArray? [indexPath.row].image)!].0)
        cell.descript.text = listArray? [indexPath.row].descript
        cell.title.text = listArray? [indexPath.row].title
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
       
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadList()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadList () {
        listArray = realm.objects(MainList.self)
        if listArray?.count == 0 {
            check()
        }else {
            self.tableView.reloadData()
        }
    }
    
    func check(){
        print("nothing")
        let nothingView = UIView()
        nothingView.backgroundColor = .white
        nothingView.frame = CGRect(x: 0, y: self.view.frame.height / 3, width: self.view.frame.width, height: self.view.frame.height / 2)
        view.addSubview(nothingView)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foodfighter")
        imageView.frame = CGRect(x: (view.frame.width - 150) / 2 , y: 0, width: 150, height: 150)
        nothingView.addSubview(imageView)
        
        let label = UILabel()
        label.text = "등록된 일정이 없습니다 😛"
        label.sizeToFit()
        label.textAlignment = .center
        label.frame = CGRect(x: (view.frame.width - 200) / 2, y: 0 , width: 200, height: 20)
        nothingView.addSubview(label)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

