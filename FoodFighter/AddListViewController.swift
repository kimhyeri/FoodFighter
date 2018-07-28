//
//  AddListViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RealmSwift

class AddListViewController: UIViewController {
    let realm = try! Realm()
    
    var listArray : Results<MainList>?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func save(foodList: MainList) {
        do{
            try realm.write{
                realm.add(foodList)
            }
        }catch {
            print("error")
        }
    }
    
    @IBAction func pressedSaveButton(_ sender: Any) {
        let new = MainList()
        new.title = "Food"
        new.descript = "hehe"
        new.createdTime = Date()
        self.save(foodList: new)
        self.navigationController?.popViewController(animated: true)
    }
}
