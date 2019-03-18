//
//  ProcessSignInViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 18/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ProcessSignInViewController: UIViewController {
    
    public var username: String = "";
    public var password: String = "";
    public var securityCode: String = "";
    
    private var statusLabel: UILabel! = nil
    
    override func viewDidAppear(_ animated: Bool) {
        statusLabel.text = "Signing in as \n\(username)"
        initiateSignIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
    }
    
    func initiateSignIn() {
        MTApi.login(withUsername: self.username, password: self.password, securityCode: self.securityCode) { (success, userDetails) in
            guard success else { return }
            if let details = userDetails {
                MTDefaults.userDetails = details
                self.getUserDetailsFrom(username: details.username)
            }
        }
    }
    
    func getUserDetailsFrom(username: String) {
        statusLabel.text = "Getting user details from\n\(username)"
        MTApi.getUserDetails(fromUsername: username) { (success: Bool, profile: UserProfile?) in
            UserProfile.query().fetch().remove()
            profile?.commit();
//            startWelcomeAndTransition()
        }
    }
    
    func setupViews() {
        self.view.backgroundColor = LPSColors.primary
        
        let indicatorContainer = UIView()
        indicatorContainer.translatesAutoresizingMaskIntoConstraints = false
        indicatorContainer.clipsToBounds = false
        self.view.addSubview(indicatorContainer)
        indicatorContainer.heightAnchor.constraint(equalToConstant: 300).isActive = true
        indicatorContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        indicatorContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        indicatorContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicatorContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let loadingSpinner = UIActivityIndicatorView(style: .whiteLarge)
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        indicatorContainer.addSubview(loadingSpinner)
        loadingSpinner.startAnimating()
        loadingSpinner.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loadingSpinner.widthAnchor.constraint(equalToConstant: 45).isActive = true
        loadingSpinner.topAnchor.constraint(equalTo: indicatorContainer.topAnchor).isActive = true
        loadingSpinner.centerXAnchor.constraint(equalTo: indicatorContainer.centerXAnchor).isActive = true
        
        statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = LPSFonts.quicksandMedium.of(size: 22.0)
        statusLabel.textColor = LPSColors.white
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0
        indicatorContainer.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: loadingSpinner.bottomAnchor, constant: 4).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: indicatorContainer.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: indicatorContainer.trailingAnchor).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: indicatorContainer.bottomAnchor).isActive = true
    }
    
}
