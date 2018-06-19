//
//  GetDate.swift
//  CalendarMobile
//
//  Created by C4Q on 6/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

struct GetDate {
    static func getFirstWeekDay(year: Int, month: Int) -> Int {
        let day = ("\(year)-\(month)-01".toDate?.firstDayOfTheMonth.weekday)!
        //return day == 7 ? 1 : day
        return day
    }
}

// get first day of the month
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    var toDay: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    var getHour: String {
        return "\(Calendar.current.component(.hour, from: self))"
    }
    
    var getMinutes: String {
        return "\(Calendar.current.component(.minute, from: self))"
    }
    
    var getSeconds: String {
        return "\(Calendar.current.component(.second, from: self))"
    }
}

// get date from string
extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var toDate: Date? {
        return String.dateFormatter.date(from: self)
    }
}

// get Time from Int
extension Int {
    var toTime: Date {
        let timeInterval = Double (self)
        return Date(timeIntervalSince1970: timeInterval)
    }
}
