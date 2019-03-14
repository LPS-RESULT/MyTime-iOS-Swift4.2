//
//  SignInViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 13/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import UIKit
import MaterialDesignSymbol

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
    }
    
    func setupViews() {
//        self.view.backgroundColor = LPSColors.primary
        self.view.backgroundColor = UIColor.black
        
        // Unwrap self.view
        let view = self.view!
        
        // Top Logo
        let topLogo = UIImageView(image: UIImage(named: "lps_logo"))
        topLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topLogo)
        topLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        topLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topLogo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        topLogo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        topLogo.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        let topSubtext = UILabel()
        topSubtext.translatesAutoresizingMaskIntoConstraints = false
        topSubtext.text = "get started"
        topSubtext.font = LPSFonts.quicksandRegular.of(size: 16.0)
        topSubtext.textColor = LPSColors.white34
        view.addSubview(topSubtext)
        topSubtext.topAnchor.constraint(equalTo: topLogo.lastBaselineAnchor, constant: 60).isActive = true
        topSubtext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        let topText = UILabel()
        topText.translatesAutoresizingMaskIntoConstraints = false
        topText.text = "Sign in"
        topText.font = LPSFonts.quicksandMedium.of(size: 30.0)
        topText.textColor = LPSColors.white
        view.addSubview(topText)
        topText.topAnchor.constraint(equalTo: topSubtext.bottomAnchor, constant: -2).isActive = true
        topText.leadingAnchor.constraint(equalTo: topSubtext.leadingAnchor).isActive = true
        
        
    }
    
    
}
