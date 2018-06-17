//
//  CalendarView+Delegate.swift
//  CalendarMobile
//
//  Created by C4Q on 6/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

// MARK:- Dimension of the cells
extension CalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCellsInRow: CGFloat = 7.0
        let numOfSpace = numCellsInRow + 1
        let width = (collectionView.bounds.width - numOfSpace * cellSpacing) / numCellsInRow
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
}

// MARK:-
extension CalendarView: UICollectionViewDelegate {
    
}

// MARK:- Populate collection view with data
extension CalendarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let days = numOfDaysInMonth[currentMonthIndex] else {return 0}
        return days + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCVCell", for: indexPath) as? DayCVCell {
            if indexPath.row <= firstWeekDayOfMonth - 2 {
                cell.isHidden = true
            } else {
                let calcDate = indexPath.row - firstWeekDayOfMonth + 2
                cell.isHidden = false
                cell.lbl.text = "\(calcDate)"
//                if indexPath.item == todaysDate + firstWeekDayOfMonth - 2 {
//                    cell.isSelected = true
//                }
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
}
