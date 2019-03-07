//
//  FoodList.swift
//  FoodFighter
//
//  Created by hyerikim on 2018. 7. 29..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation

@objc enum FoodList: Int, CaseIterable {
    
    case 한식 = 0
    case 중식
    case 일식
    case 양식
    case 패스트푸드
    case 디저트
    case 야식
    
    var enumString: String {
        switch self {
        case .한식:
            return "한식"
        case .중식:
            return "중식"
        case .일식:
            return "일식"
        case .양식:
            return "양식"
        case .패스트푸드:
            return "패스트푸드"
        case .디저트:
            return "디저트"
        case .야식:
            return "야식"
        }
    }
    
    var imageString: String {
        switch self {
        case .한식:
            return "image0"
        case .중식:
            return "image1"
        case .일식:
            return "image2"
        case .양식:
            return "image3"
        case .패스트푸드:
            return "image4"
        case .디저트:
            return "image5"
        case .야식:
            return "image6"
        }
    }
    
    static var count: Int {
        return FoodList.allCases.count
    }
}
