//
//  EventView.swift
//  CalendarMobile
//
//  Created by C4Q on 6/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class EventView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.backgroundColor = UIColor(displayP3Red: 255/255, green: 180/255, blue: 0.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
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

