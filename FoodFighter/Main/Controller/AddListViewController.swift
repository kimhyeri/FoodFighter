//
//  AddListViewController.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import RealmSwift
import SkyFloatingLabelTextField

class AddListViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var upperStackView: UIStackView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateText: SkyFloatingLabelTextField!
    @IBOutlet weak var restName: SkyFloatingLabelTextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet var text: [SkyFloatingLabelTextField]!

    private let realm = try! Realm()
    private var datePicker: UIDatePicker?
    private var buttonCount = 0
    private var totalCount = FoodList.count
    private var myDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        labelView.layer.cornerRadius = 10
        addTextField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @IBAction func pressedSaveButton(_ sender: Any) {
        guard let data = createData() else { return }
        self.save(foodList: data)
        moveToDefaultPage()
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        switch sender.tag {
        case 0: //up
            addCount(num: +1)
        default: //down
            addCount(num: -1)
        }
    }
    
    @IBAction func textChanged(_ sender: SkyFloatingLabelTextField) {
        checkAvailable()
    }

    private func save(foodList: MainList) {
        do{
            try realm.write{
                realm.add(foodList)
            }
        } catch {
            print("error")
        }
    }
    
    private func createData() -> MainList? {
        guard let title = restName.text,
            let date = dateText.text else { return nil }
        let new = MainList()
        new.title = title
        new.descript = date
        new.imageString = FoodList.allCases[buttonCount].imageString
        new.createdTime = myDate
        return new
    }
    
    private func checkAvailable() {
        guard restName.text?.isEmpty == false,
            dateText.text?.isEmpty == false else { return }
        saveButton.isEnabled = true
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        myDate = datePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY년 MM월 dd일 HH시 mm분"
        dateText.text = dateFormat.string(from: datePicker.date)
    }

    private func addCount(num: Int) {
        if buttonCount == 0 {
            buttonCount = totalCount
        } else if buttonCount == totalCount {
            buttonCount = 0
        } else {
            buttonCount += num
        }
        setupImage(count: buttonCount)
    }
}

extension AddListViewController {
    private func setupImage(count: Int) {
        self.imageName.text = FoodList.allCases[count].enumString
        self.imageView.image = UIImage(named: FoodList.allCases[count].imageString)
    }
    
    private func addTextField(){
        let rose = UIColor(red: 188/255,
                           green: 109/255, 
                           blue: 79/255,
                           alpha: 1.0
        )
        restName.placeholder = "가게명을 입력해주세요"
        restName.title = "그곳이 맛집이군요 😄"   
        dateText.placeholder = "날짜를 선택해주세요"
        dateText.title = "잘 기다려 봅시다 😄"
        
        text.forEach({ (textField) in 
            textField.setValue(rose, forKeyPath: "_placeholderLabel.textColor")
            textField.titleColor = rose
            textField.tintColor = .darkGray
            textField.selectedLineColor = rose
            textField.selectedTitleColor = rose
            textField.textColor = .darkGray
            textField.lineColor = rose
        })
        
        datePicker = UIDatePicker()
        datePicker?.backgroundColor = UIColor.clear
        datePicker?.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        datePicker?.minimumDate = Date()
        dateText.inputView = datePicker
    }
}
