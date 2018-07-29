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
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateText: SkyFloatingLabelTextField!
    @IBOutlet weak var restName: SkyFloatingLabelTextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
//    var images = [("image0","한식"),("image1", "중식"),("image2", "일식"),("image3", "양식"),("image4", "패스트푸드"),("image5", "디저트"),("image6", "야식")]
    var foodList = FoodList()
    var buttonCount = 0
    
    let realm = try! Realm()
    var datePicker : UIDatePicker?
    var listArray : Results<MainList>?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false

        addStatusBar()
        addTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @IBAction func pressedSaveButton(_ sender: Any) {
        let new = MainList()
        new.title = (restName.text)!
        new.descript = (dateText.text)!
        new.image = self.buttonCount
        new.createdTime = date
        
        self.save(foodList: new)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "start") as! CustomNaviController
        self.present(vc, animated: true, completion: nil)
    }
    
    func addTextField(){
        let rose = UIColor(red: 188/255, green: 109/255, blue: 79/255, alpha: 1.0)
        let orange = UIColor(red: 255/255, green: 122/255, blue: 71/255, alpha: 1.0)
        restName.placeholder = "가게명을 입력해주세요"
        restName.title = "그곳이 맛집이군요 😄"
        self.secondView.addSubview(restName)
        
        restName.setValue(rose, forKeyPath: "_placeholderLabel.textColor")
        restName.titleColor = rose
        restName.selectedLineColor = rose
        restName.selectedTitleColor = rose
        restName.textColor = orange
        restName.lineColor = rose
        
        dateText.placeholder = "날짜를 선택해주세요"
        dateText.title = "잘 기다려 봅시다 😄"
        dateText.setValue(rose, forKeyPath: "_placeholderLabel.textColor")
        dateText.titleColor = rose
        dateText.selectedLineColor = rose
        dateText.selectedTitleColor = rose
        dateText.textColor = orange
        dateText.lineColor = rose
        
        datePicker = UIDatePicker()
        datePicker?.backgroundColor = UIColor(hexString: "#FFD4B7")
        datePicker?.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        datePicker?.minimumDate = Date() 
        dateText.inputView = datePicker

    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        date = datePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY년 MM월 dd일 HH시 mm분"
        dateText.text = dateFormat.string(from: datePicker.date)
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
    
    func setImage(count: Int) {
        self.imageName.text = foodList.images[count].1
        self.imageView.image = UIImage(named: foodList.images[count].0)
    }
    

    func checkBolck() {
        if (restName.text?.count)! >= 1 && (dateText.text?.count)! >= 1 {
            saveButton.isEnabled = true
        }else{
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func textChanged(_ sender: SkyFloatingLabelTextField) {
        checkBolck()
    }
}

