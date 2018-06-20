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
    
    var events = [Event]() {
        didSet {
            self.eventsByDay = events.filter{$0.startTime.toDay == calendarView.todaysDate}.sorted(by: {$0.startTime < $1.startTime})
        }
    }
    
    var eventsByDay = [Event]() {
        didSet {
            DispatchQueue.main.async {
                self.eventView.eventListTV.reloadData()
            }
        }
    }
    
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
        initCalendarView()
        initEventView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        EventAPIClient.manager.getEvents(completionHandler: { (eventOnline) in
            self.events = eventOnline
        }, errorHandler: {print($0)})
    }
    
    private func initCalendarView() {
        calendarView.calendarCV.delegate = self
        calendarView.calendarCV.dataSource = self
        calendarView.calendarCV.backgroundColor = .white
        
        calendarView.currentMonthIndex = Calendar.current.component(.month, from: Date())
        calendarView.currentYear = Calendar.current.component(.year, from: Date())
        calendarView.todaysDate = Calendar.current.component(.day, from: Date())
        calendarView.firstWeekDayOfMonth = GetDate.getFirstWeekDay(year: calendarView.currentYear, month: calendarView.currentMonthIndex)
        
        // Check for leap years
        if calendarView.currentMonthIndex == 2 && calendarView.currentYear % 4 == 0 {
            calendarView.numOfDaysInMonth[calendarView.currentMonthIndex] = 29
        }
        
        calendarView.presentMonthIndex = calendarView.currentMonthIndex
        calendarView.presentYear = calendarView.currentYear
        
        // selected cell at today
        calendarView.calendarCV.selectItem(at: IndexPath(row: calendarView.todaysDate + calendarView.firstWeekDayOfMonth - 2, section: 0), animated: true, scrollPosition: .left)
    }
    
    private func initEventView() {
        eventView.eventListTV.register(EventTVCell.self, forCellReuseIdentifier: "event")
        eventView.eventListTV.register(EmptyEventTVCell.self, forCellReuseIdentifier: "empty")
        eventView.eventListTV.delegate = self
        eventView.eventListTV.dataSource = self
    }
    
    private func menuTabBar() {
        navigationItem.title = "Calendar"
        let addTaskBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = addTaskBtn
    }
    
    @objc private func addTask() {
        let addEventVC = AddEventVC()
        let year = calendarView.currentYear
        let month = calendarView.currentMonthIndex
        let day = calendarView.todaysDate
        addEventVC.addEventView.startTime.date = "\(year)-\(month)-\(day)".toDate!
        addEventVC.addEventView.endTime.date = "\(year)-\(month)-\(day)".toDate!
        navigationController?.present(addEventVC, animated: true, completion: nil)
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

    }
}

