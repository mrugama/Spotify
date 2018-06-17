//
//  AddEventView.swift
//  CalendarMobile
//
//  Created by C4Q on 6/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class AddEventView: UIView {

    lazy var startTime: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.datePickerMode = UIDatePickerMode.time
        return dp
    }()
    
    lazy var endTime: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.datePickerMode = UIDatePickerMode.time
        return dp
    }()
    
    lazy var descriptionTxtField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Enter your task..."
        text.backgroundColor = UIColor.white
        return text
    }()
    
    lazy var submitBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Submit", for: .normal)
        return btn
    }()
    
    lazy var stackView: UIStackView = {
        let stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.axis  = UILayoutConstraintAxis.vertical
        stView.distribution  = UIStackViewDistribution.fillEqually
        stView.alignment = UIStackViewAlignment.center
        stView.spacing   = 0.0
        return stView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(displayP3Red: 246/255, green: 81/255, blue: 29/255, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
        //,
//        stackView.topAnchor.constraint(equalTo: self.topAnchor),
//        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//        stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
//        stackView.rightAnchor.constraint(equalTo: self.rightAnchor)
        
        stackView.addArrangedSubview(descriptionTxtField)
        stackView.addArrangedSubview(startTime)
        stackView.addArrangedSubview(endTime)
        stackView.addArrangedSubview(submitBtn)
    }
    
}
