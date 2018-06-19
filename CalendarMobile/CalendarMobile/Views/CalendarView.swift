//
//  CalendarView.swift
//  CalendarMobile
//
//  Created by C4Q on 6/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CalendarView: UIView {
    
    let cellSpacing: CGFloat = 8.0
    
    var numOfDaysInMonth = [1:31,2:28,3:31,4:30,
                            5:31,6:30,7:31,8:31,
                            9:30,10:31,11:30,12:31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    
    lazy var calendarCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(DayCVCell.self, forCellWithReuseIdentifier: "CalendarCVCell")
        cv.allowsMultipleSelection = false
        return cv
    }()
    
    let weekdaysView: WeekdaysView = {
        let view = WeekdaysView()
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(weekdaysView)
        NSLayoutConstraint.activate([
            weekdaysView.topAnchor.constraint(equalTo: self.topAnchor),
            weekdaysView.leftAnchor.constraint(equalTo: leftAnchor),
            weekdaysView.rightAnchor.constraint(equalTo: rightAnchor),
            weekdaysView.heightAnchor.constraint(equalToConstant: 30)])
        
        addSubview(calendarCV)
        NSLayoutConstraint.activate([
            calendarCV.topAnchor.constraint(equalTo: weekdaysView.bottomAnchor),
            calendarCV.leftAnchor.constraint(equalTo: self.leftAnchor),
            calendarCV.rightAnchor.constraint(equalTo: self.rightAnchor),
            calendarCV.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
