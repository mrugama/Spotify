//
//  EventTVCell.swift
//  CalendarMobile
//
//  Created by C4Q on 6/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class EventTVCell: UITableViewCell {
    
    lazy var descriptionLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Empty"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var startLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.red
        label.text = "From: "
        label.textAlignment = .left
        return label
    }()
    
    lazy var starTimeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00:00"
        label.textAlignment = .left
        return label
    }()
    
    lazy var endLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.red
        label.text = "to: "
        label.textAlignment = .left
        return label
    }()
    
    lazy var endTimeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00:00"
        label.textAlignment = .left
        return label
    }()
    
    lazy var startStack: UIStackView = {
        let stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.axis  = UILayoutConstraintAxis.horizontal
        stView.distribution  = UIStackViewDistribution.fillEqually
        stView.alignment = UIStackViewAlignment.leading
        stView.spacing = 2.0
        return stView
    }()
    
    lazy var endStack: UIStackView = {
        let stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.axis  = UILayoutConstraintAxis.horizontal
        stView.distribution  = UIStackViewDistribution.fillEqually
        stView.alignment = UIStackViewAlignment.leading
        stView.spacing = 2.0
        return stView
    }()
    
    lazy var stackView: UIStackView = {
        let stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.axis  = UILayoutConstraintAxis.vertical
        stView.distribution  = UIStackViewDistribution.fillEqually
        stView.alignment = UIStackViewAlignment.center
        stView.spacing = 2.0
        return stView
    }()
    
    public func configureCell(event: Event) {
        self.backgroundColor = UIColor(displayP3Red: 255/255, green: 180/255, blue: 0.0, alpha: 1.0)
        descriptionLbl.text = event.task
        starTimeLbl.text = event.startTime.getHour + ":" + event.startTime.getMinutes + ":" + event.startTime.getSeconds
        endTimeLbl.text = event.endTime.getHour + ":" + event.endTime.getMinutes + ":" + event.endTime.getSeconds
        setupViews()
    }
    
    private func setupViews() {
        addSubview(descriptionLbl)
        NSLayoutConstraint.activate([
            descriptionLbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            descriptionLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            descriptionLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            descriptionLbl.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.5)])
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
        stackView.addArrangedSubview(startStack)
        NSLayoutConstraint.activate([
            startStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.30)])
        stackView.addArrangedSubview(endStack)
        NSLayoutConstraint.activate([
            endStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.30)])
        startStack.addArrangedSubview(startLbl)
        startStack.addArrangedSubview(starTimeLbl)
        endStack.addArrangedSubview(endLbl)
        endStack.addArrangedSubview(endTimeLbl)
    }

}
