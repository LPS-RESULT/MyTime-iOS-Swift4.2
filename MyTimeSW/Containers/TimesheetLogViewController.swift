//
//  TimesheetLogViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 21/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import UIKit

class TimesheetLogViewController: UIViewController {
    
    private var projectDescriptionLabel: UILabel!
    
    public var timesheetLog: TimesheetLog?
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = LPSColors.white
        
        projectDescriptionLabel = UILabel()
        projectDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        projectDescriptionLabel.font = LPSFonts.quicksandRegular.of(size: 14.0)
        projectDescriptionLabel.textColor = LPSColors.primaryDark
        projectDescriptionLabel.text = timesheetLog?.descriptionC ?? ""
        self.view.addSubview(projectDescriptionLabel)
        projectDescriptionLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        projectDescriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        projectDescriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
    }
}
