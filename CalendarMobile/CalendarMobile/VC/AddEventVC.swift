//
//  AddEventVC.swift
//  CalendarMobile
//
//  Created by C4Q on 6/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class AddEventVC: UIViewController {
    
    let addEventView = AddEventView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addEventView.submitBtn.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        //addEventView.delegate = self
    }
    
    @objc private func saveTask() {
        //let calendarVC = CalendarVC()
        guard let task = addEventView.descriptionTxtField.text else {return}
        let startTime = addEventView.startTime.date //.toTimeInt
        let endTime = addEventView.endTime.date //.toTimeInt
        let eventTask = Event(id: nil, startTime: startTime, endTime: endTime, task: task)
        EventAPIClient.manager.post(event: eventTask, errorHandler: {print($0)})
//        EventAPIClient.manager.getEvents(completionHandler: { (eventOnline) in
//            calendarVC.events = eventOnline
//        }, errorHandler: {print($0)})
        //calendarVC.events.append(eventTask)
        //calendarVC.eventView.eventListTV.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupViews() {
        view.addSubview(addEventView)
        addEventView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addEventView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addEventView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            addEventView.leftAnchor.constraint(equalTo: view.leftAnchor),
            addEventView.rightAnchor.constraint(equalTo: view.rightAnchor)])
    }
}
