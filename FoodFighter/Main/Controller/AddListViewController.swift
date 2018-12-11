//
//  AddListViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

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
    var datePicker : UIDatePicker?
    private var buttonCount = 0
    private var listArray : Results<MainList>?
    private var myDate: Date?
    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        labelView.layer.cornerRadius = 10
        addTextField()
    }
    
    @IBAction func pressedSaveButton(_ sender: Any) {
        
        let new = MainList()

        guard let title = restName.text else { return }
        guard let date = dateText.text else { return }

        new.title = title
        new.descript = date
        new.image = self.buttonCount
        new.createdTime = myDate
        
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
        myDate = datePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY년 MM월 dd일 HH시 mm분"
        dateText.text = dateFormat.string(from: datePicker.date)
    }
    
    func checkBolck() {
        
        if let restCount = restName.text?.count, let dateCount = dateText.text?.count {
            if restCount >= 1 && dateCount >= 1 {
                saveButton.isEnabled = true
            } else {
                saveButton.isEnabled = false
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

