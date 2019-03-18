//
//  HomeViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 13/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import UIKit
import SharkORM

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        if MTDefaults.userDetails == nil {
            self.present(SignInViewController(), animated: false, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}
