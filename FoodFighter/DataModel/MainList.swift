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
    @objc dynamic var title : String = "" //식당
    @objc dynamic var descript : String = "" //시간
    @objc dynamic var image : Int = 0 //카테고리 이미지
    @objc dynamic var done : Bool = false //먹었는지 안먹었는지
    @objc dynamic var createdTime : Date? //등록시간
}
