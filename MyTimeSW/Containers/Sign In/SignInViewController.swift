//
//  SignInViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 13/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let testLabel = UILabel(frame: CGRect(x: 0, y: 200, width: 300, height: 40))
        testLabel.text = "test"
        self.view.addSubview(testLabel)
        self.view.backgroundColor = LPSColors.Primary
        
        // Unwrap self.view
        let view = self.view!
        
        // Top Logo
        let topLogo = UIImageView(image: UIImage(named: "lps_logo"))
        topLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topLogo)
        
        // Setup constraints
        topLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        topLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topLogo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        topLogo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        topLogo.widthAnchor.constraint(equalToConstant: 180).isActive = true
        topLogo.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
}
