//
//  TimesheetLogCell.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 20/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import UIKit
import GMStepper

class TimesheetLogCell: UITableViewCell {
    
    public var hoursText: String {
        get {
            return self.hoursLabel.text ?? ""
        } set {
            self.hoursLabel.text = newValue
            self.hourStepper.value = Double(newValue) ?? 0
        }
    }
    
    public var titleText: String {
        get {
            return self.hoursLabel.text ?? ""
        } set {
            self.titleLabel.text = newValue
        }
    }
    
    public var subtext: String {
        get {
            return self.hoursLabel.text ?? ""
        } set {
            self.subtextLabel.text = newValue
        }
    }
    
    public var hourStepper: GMStepper!
    public var hoursLabel: UILabel!
    public var titleLabel: UILabel!
    public var subtextLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: "")
        setupViews()
    }
    
    func setupViews() {
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        let cellView = UIView()
        cellView.backgroundColor = UIColor.white
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 4
        cellView.layer.shadowOpacity = 0.15
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowRadius = 4
        cellView.layer.shadowOffset = CGSize.zero
        self.addSubview(cellView)
        cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6).isActive = true
        cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6).isActive = true
        
        let hourContainer = UIView()
        hourContainer.backgroundColor = LPSColors.primary
        hourContainer.translatesAutoresizingMaskIntoConstraints = false
        hourContainer.layer.cornerRadius = 4
        hourContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        cellView.addSubview(hourContainer)
        hourContainer.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        hourContainer.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        hourContainer.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        hourContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        hoursLabel = UILabel()
        hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        hoursLabel.font = LPSFonts.ralewayRegular.of(size: 35.0)
        hoursLabel.textAlignment = .center
        hoursLabel.textColor = LPSColors.white
        hourContainer.addSubview(hoursLabel)
        hoursLabel.centerXAnchor.constraint(equalTo: hourContainer.centerXAnchor).isActive = true
        hoursLabel.centerYAnchor.constraint(equalTo: hourContainer.centerYAnchor).isActive = true
        
        hourStepper = GMStepper(frame: CGRect.zero)
        hourStepper.translatesAutoresizingMaskIntoConstraints = false
        hourStepper.layer.cornerRadius = 4
        hourStepper.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        hourStepper.value = 6
        hourStepper.stepValue = 0.5
        hourStepper.minimumValue = 0
        hourStepper.maximumValue = 24
        hourStepper.buttonsBackgroundColor = LPSColors.primary
        hourStepper.labelBackgroundColor = LPSColors.primary
        hourStepper.leftButtonText = ""
        hourStepper.rightButtonText = ""
        hourStepper.hideButtons()
        hourStepper.backgroundColor = LPSColors.white
        hourStepper.clipsToBounds = false
        cellView.addSubview(hourStepper)
        hourStepper.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        hourStepper.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        hourStepper.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        hourStepper.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = LPSFonts.quicksandMedium.of(size: 18.0)
        titleLabel.textColor = LPSColors.textPrimaryDark
        cellView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 6).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: hourContainer.trailingAnchor, constant: 6).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -6).isActive = true
        
        subtextLabel = UILabel()
        subtextLabel.translatesAutoresizingMaskIntoConstraints = false
        subtextLabel.font = LPSFonts.quicksandMedium.of(size: 14.0)
        subtextLabel.numberOfLines = 2
        subtextLabel.textColor = LPSColors.textSecondaryDark
        cellView.addSubview(subtextLabel)
        subtextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtextLabel.leadingAnchor.constraint(equalTo: hourContainer.trailingAnchor, constant: 6).isActive = true
        subtextLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -6).isActive = true
    }
}
