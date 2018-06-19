//
//  Event.swift
//  CalendarMobile
//
//  Created by C4Q on 6/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct Event: Codable {
    let id: String?
//    let dateId: Int
//    let year: Int
//    let month: Int
//    let day: Int
    let startTime: Date
    let endTime: Date
    let task: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
//        case dateId
//        case year
//        case month
//        case day
        case startTime
        case endTime
        case task = "description"
    }
}
