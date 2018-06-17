//
//  DayCVCell.swift
//  CalendarMobile
//
//  Created by C4Q on 6/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class DayCVCell: UICollectionViewCell {
    
    let lbl: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.layer.frame.width / 2
        self.layer.masksToBounds = true
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(lbl)
        lbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbl.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lbl.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.lbl.backgroundColor = .red
                self.lbl.textColor = .white
                self.lbl.layer.cornerRadius = self.layer.frame.width / 2
                self.lbl.layer.borderWidth = 2
                self.lbl.layer.borderColor = UIColor.black.cgColor
            } else {
                self.lbl.backgroundColor = UIColor.clear
                self.lbl.textColor = UIColor.black
                self.lbl.layer.borderWidth = 0
                self.lbl.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
}
