//
//  ViewController.swift
//  CalendarMobile
//
//  Created by C4Q on 6/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
    
    let calendarView = CalendarView()
    let eventView = EventView()
    let addEventView = AddEventView()
    
    lazy var stackView: UIStackView = {
        let stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.axis  = UILayoutConstraintAxis.vertical
        stView.distribution  = UIStackViewDistribution.fillEqually
        stView.alignment = UIStackViewAlignment.center
        stView.spacing   = 0.0
        return stView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        menuTabBar()
        addEventView.submitBtn.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
    }
    
    private func menuTabBar() {
        navigationItem.title = "Calendar"
        let addTaskBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = addTaskBtn
    }
    
    @objc private func addTask() {
        UIView.animate(withDuration: 0.5) {
            self.addEventView.layer.opacity = 1.0
        }
    }
    
    @objc private func saveTask() {
        UIView.animate(withDuration: 0.5) {
            self.addEventView.layer.opacity = 0.0
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        stackView.addArrangedSubview(calendarView)
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            calendarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            calendarView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)])
        
        stackView.addArrangedSubview(eventView)
        eventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
            eventView.leftAnchor.constraint(equalTo: view.leftAnchor),
            eventView.rightAnchor.constraint(equalTo: view.rightAnchor),
            eventView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        view.addSubview(addEventView)
        addEventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addEventView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addEventView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            addEventView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            addEventView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)])
        addEventView.layer.opacity = 0.0

    }
}

