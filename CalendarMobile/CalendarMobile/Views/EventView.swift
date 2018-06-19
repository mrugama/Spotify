//
//  EventView.swift
//  CalendarMobile
//
//  Created by C4Q on 6/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class EventView: UIView {
    
    lazy var eventListTV: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 120
        tv.backgroundColor = UIColor(displayP3Red: 255/255, green: 180/255, blue: 0.0, alpha: 1.0)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(eventListTV)
        NSLayoutConstraint.activate([
            eventListTV.topAnchor.constraint(equalTo: self.topAnchor),
            eventListTV.leftAnchor.constraint(equalTo: self.leftAnchor),
            eventListTV.rightAnchor.constraint(equalTo: self.rightAnchor),
            eventListTV.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
}

