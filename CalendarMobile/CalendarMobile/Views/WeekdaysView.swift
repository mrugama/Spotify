//
//  WeekdaysView.swift
//  CalendarMobile
//
//  Created by C4Q on 6/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class WeekdaysView: UIView {

    let myStackView: UIStackView = {
        let stackView=UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints=false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(myStackView)
        NSLayoutConstraint.activate([
            myStackView.topAnchor.constraint(equalTo: self.topAnchor),
            myStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            myStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            myStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        var daysArr = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
        for i in 0..<7 {
            let lblDay=UILabel()
            lblDay.text=daysArr[i]
            lblDay.textAlignment = .center
            lblDay.textColor = UIColor.darkGray
            myStackView.addArrangedSubview(lblDay)
        }
    }

}
