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
        topLogo.frame = CGRect(x: 0, y: 0, width: 180, height: 48)
        
        view.addSubview(topLogo)
        
        NSLayoutConstraint.activate([topLogo.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0)])
    }
    
    
}
