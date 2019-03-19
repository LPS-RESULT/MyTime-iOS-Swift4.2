//
//  File.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 19/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import UIKit

class DayView: UIView {
    
    var selected: Bool {
        get {
            return self.alpha == 1.0
        } set {
            self.alpha = newValue ? 1.0 : 0.25
            self.backgroundColor = newValue ? UIColor.white : UIColor.clear
        }
    }
    var dayNameText: String {
        get {
            return self.dayNameLabel.text ?? ""
        } set {
            self.dayNameLabel.text = newValue
        }
    }
    var dayNumberText: String {
        get {
            return self.dayNumberLabel.text ?? ""
        } set {
            self.dayNumberLabel.text = newValue
        }
    }
    var dayNameLabel: UILabel!
    var dayNumberLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    init(withDayName dayName: String, dayNumber: String) {
        super.init(frame: CGRect.zero)
        setupViews()
        self.dayNameText = dayName
        self.dayNumberText = dayNumber
    }

    func setupViews() {
        dayNameLabel = UILabel()
        dayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dayNameLabel.textAlignment = .center
        dayNameLabel.font = LPSFonts.quicksandRegular.of(size: 12.0)
        dayNameLabel.textColor = selected ? LPSColors.black : LPSColors.black
        self.addSubview(dayNameLabel)
        dayNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        dayNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        dayNumberLabel = UILabel()
        dayNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        dayNumberLabel.textAlignment = .center
        dayNumberLabel.font = LPSFonts.ralewayRegular.of(size: 28.0)
        dayNumberLabel.textColor = LPSColors.black
        self.addSubview(dayNumberLabel)
        dayNumberLabel.topAnchor.constraint(equalTo: dayNameLabel.bottomAnchor).isActive = true
        dayNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
