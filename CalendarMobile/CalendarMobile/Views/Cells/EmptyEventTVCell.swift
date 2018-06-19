//
//  EmptyEventTVCell.swift
//  CalendarMobile
//
//  Created by C4Q on 6/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class EmptyEventTVCell: UITableViewCell {

    lazy var eventImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "icoCalendar_64x64")
        return image
    }()
    
    lazy var txtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No events or tasks"
        label.textAlignment = .center
        return label
    }()
    
    public func configureCell() {
        self.backgroundColor = UIColor(displayP3Red: 255/255, green: 180/255, blue: 0.0, alpha: 1.0)
        addSubview(eventImage)
        NSLayoutConstraint.activate([
            eventImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            eventImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
        eventImage.addSubview(txtLabel)
        NSLayoutConstraint.activate([
            txtLabel.topAnchor.constraint(equalTo: eventImage.bottomAnchor),
            txtLabel.centerXAnchor.constraint(equalTo: eventImage.centerXAnchor)])
    }

}
