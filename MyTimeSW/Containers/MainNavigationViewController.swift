//
//  ViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 13/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setViewControllers([HomeViewController()], animated: false)
    }


}

