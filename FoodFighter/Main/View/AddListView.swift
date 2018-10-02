//
//  AddListView.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 9. 21..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

extension AddListViewController {
    
    func setImage(count: Int) {
        self.imageName.text = foodList.images[count].1
        self.imageView.image = UIImage(named: foodList.images[count].0)
    }
    
    func addTextField(){
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
