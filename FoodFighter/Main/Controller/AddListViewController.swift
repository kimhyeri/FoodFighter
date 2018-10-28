//
//  AddListViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import RealmSwift
import SkyFloatingLabelTextField


class AddListViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateText: SkyFloatingLabelTextField!
    @IBOutlet weak var restName: SkyFloatingLabelTextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!

    var foodList = FoodList()
    var buttonCount = 0
    var datePicker : UIDatePicker?
    var listArray : Results<MainList>?
    var date: Date?
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        labelView.layer.cornerRadius = 10
        addTextField()
    }
    
    @IBAction func pressedSaveButton(_ sender: Any) {
        let new = MainList()

        if let title = restName.text {
            new.title = title
        }
        
        if let date = dateText.text {
            new.descript = date
        }
        
        new.image = self.buttonCount
        new.createdTime = date
        
        self.save(foodList: new)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "start") as! CustomNaviController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        if sender.tag == 0 {
            if(buttonCount == 0) {
                buttonCount = foodList.images.count - 1
                setImage(count: buttonCount)
            } else {
                buttonCount = buttonCount - 1
                setImage(count: buttonCount)
            }
        }else{
            if(buttonCount == foodList.images.count - 1) {
                buttonCount = 0
                setImage(count: buttonCount)
            } else {
                buttonCount = buttonCount + 1
                setImage(count: buttonCount)
            }
        }
    }
    
    @IBAction func textChanged(_ sender: SkyFloatingLabelTextField) {
        checkBolck()
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
    
    @objc func dateChanged(datePicker: UIDatePicker){
        date = datePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY년 MM월 dd일 HH시 mm분"
        dateText.text = dateFormat.string(from: datePicker.date)
    }
    
    func checkBolck() {
        if (restName.text?.count)! >= 1 && (dateText.text?.count)! >= 1 {
            saveButton.isEnabled = true
        }else{
            saveButton.isEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

