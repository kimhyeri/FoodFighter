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

    private let realm = try! Realm()
    private var datePicker: UIDatePicker?
    private var buttonCount = 0
    private var listArray: Results<MainList>?
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
        guard let title = restName.text else { return }
        guard let date = dateText.text else { return }
        let new = MainList()
        new.title = title
        new.descript = date
        new.imageString = FoodList.allCases[buttonCount].imageString
        new.createdTime = myDate
        self.save(foodList: new)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "start") as! CustomNaviController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if(buttonCount == 0) {
                buttonCount = FoodList.count - 1
            } else {
                buttonCount = buttonCount - 1
            }
        default:
            if(buttonCount == FoodList.count - 1) {
                buttonCount = 0
            } else {
                buttonCount = buttonCount + 1
            }
        }
        setImage(count: buttonCount)
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
}

extension AddListViewController {
    private func setImage(count: Int) {
        self.imageName.text = FoodList.allCases[count].enumString
        self.imageView.image = UIImage(named: FoodList.allCases[count].imageString)
    }
    
    private func addTextField(){
        let rose = UIColor(red: 188/255, green: 109/255, blue: 79/255, alpha: 1.0)
        restName.placeholder = "가게명을 입력해주세요"
        restName.title = "그곳이 맛집이군요 😄"
        self.secondView.addSubview(restName)
        
        restName.setValue(rose, forKeyPath: "_placeholderLabel.textColor")
        restName.titleColor = rose
        restName.tintColor = .darkGray
        restName.selectedLineColor = rose
        restName.selectedTitleColor = rose
        restName.textColor = .darkGray
        restName.lineColor = rose
        
        dateText.placeholder = "날짜를 선택해주세요"
        dateText.title = "잘 기다려 봅시다 😄"
        dateText.setValue(rose, forKeyPath: "_placeholderLabel.textColor")
        dateText.titleColor = rose
        dateText.tintColor = .darkGray
        dateText.selectedLineColor = rose
        dateText.selectedTitleColor = rose
        dateText.textColor = .darkGray
        dateText.lineColor = rose
        
        datePicker = UIDatePicker()
        datePicker?.backgroundColor = UIColor.clear
        datePicker?.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        datePicker?.minimumDate = Date()
        dateText.inputView = datePicker
    }
}
