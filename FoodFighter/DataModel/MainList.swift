//
//  MainList.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import RealmSwift

class MainList : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var descript : String = ""
    @objc dynamic var image : Int = 0
    @objc dynamic var done : Bool = false
    @objc dynamic var createdTime : Date? 
}
