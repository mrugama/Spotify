//
//  CalendarVC+Delegates.swift
//  CalendarMobile
//
//  Created by C4Q on 6/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

// MARK:- load data once tap on a day
extension CalendarVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        calendarView.todaysDate = indexPath.item - calendarView.firstWeekDayOfMonth + 2
        EventAPIClient.manager.getEvents(completionHandler: { (eventOnline) in
            self.events = eventOnline
        }, errorHandler: {print($0)})
    }
}

// MARK:- Dimension of the cells
extension CalendarVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCellsInRow: CGFloat = 7.0
        let numOfSpace = numCellsInRow + 1
        let width = (collectionView.bounds.width - numOfSpace * calendarView.cellSpacing) / numCellsInRow
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
}

// MARK:- Populate collection view with data
extension CalendarVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let days = calendarView.numOfDaysInMonth[calendarView.currentMonthIndex] else {return 0}
        return days + calendarView.firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCVCell", for: indexPath) as? DayCVCell {
            if indexPath.row <= calendarView.firstWeekDayOfMonth - 2 {
                cell.isHidden = true
            } else {
                let calcDate = indexPath.row - calendarView.firstWeekDayOfMonth + 2
                cell.isHidden = false
                cell.lbl.text = "\(calcDate)"
            }
            return cell
        }
        return UICollectionViewCell()
    }
}


// MARK:- TableView Delegates
extension CalendarVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            let event = self.eventsByDay[indexPath.row]
            EventAPIClient.manager.delete(id: event.id!, errorHandler: {print($0)})
            EventAPIClient.manager.getEvents(completionHandler: { (eventOnline) in
                self.events = eventOnline
            }, errorHandler: {print($0)})
            print("Delete")
        }
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        delete.image = #imageLiteral(resourceName: "icoDelete_32x32")
        let trailingConfig =  UISwipeActionsConfiguration(actions: [delete])
        trailingConfig.performsFirstActionWithFullSwipe = false //default is true
        return trailingConfig
    }
}

// MAR:- TableView Datasource
extension CalendarVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if eventsByDay.isEmpty {
            return 1
        }
        return eventsByDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if eventsByDay.isEmpty {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "empty", for: indexPath) as? EmptyEventTVCell {
                cell.configureCell()
                cell.setNeedsLayout()
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "event", for: indexPath) as? EventTVCell {
                let event = eventsByDay[indexPath.row]
                cell.configureCell(event: event)
                cell.setNeedsLayout()
                return cell
            }
        }
        print("Ohh no!")
        return UITableViewCell()
    }
    
    
}
