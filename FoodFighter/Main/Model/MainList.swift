//
//  MainList.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import RealmSwift

class MainList: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var descript: String = ""
    @objc dynamic var imageString: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var createdTime: Date?
}
