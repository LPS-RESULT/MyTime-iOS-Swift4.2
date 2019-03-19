//
//  HomeViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 13/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import UIKit
import SharkORM
import Kingfisher
import MaterialDesignSymbol

class HomeViewController: UIViewController {
    
    private var userDetails: MTDefaults.UserDetails?
    private var backgroundImageView: UIImageView!
    private var nameLabel: UILabel!
    private var greetingLabel: UILabel!
    private var monthButton: UIButton!
    private var profileImageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        if let details = MTDefaults.userDetails {
            userDetails = details
            // Set kingfisher image loading to always use the access token we got earlier as an auth header
            KingfisherManager.shared.defaultOptions = [.requestModifier(TokenPlugin(token: "Bearer \(userDetails?.accessToken ?? "")"))]
            populateViews()
        } else {
            self.present(SignInViewController(), animated: false, completion: nil)
        }
    }
    
    func populateViews() {
        UserProfile.query().limit(1).fetchAsync { (result) in
            if let profile = result.firstObject as? UserProfile {
                let bannerUrl = URL(string: "\(self.userDetails!.instanceUrl)\(profile.bannerPhotoURL ?? "")")
                let profileImageUrl = URL(string: "\(profile.mediumPhotoURL ?? "")")
                DispatchQueue.main.async {
                    self.backgroundImageView.kf.setImage(with: bannerUrl)
                    self.profileImageView.kf.setImage(with: profileImageUrl)
                    self.nameLabel.text = "\(profile.firstName ?? "") \(profile.lastName ?? "")"
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = LPSColors.primary
        
        let topHeaderView = UIView()
        topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topHeaderView)
        topHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        topHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        topHeaderView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.alpha = 0.65
        topHeaderView.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: topHeaderView.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: topHeaderView.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: topHeaderView.leadingAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: topHeaderView.rightAnchor).isActive = true
        
        greetingLabel = UILabel()
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.font = LPSFonts.quicksandRegular.of(size: 15.0)
        greetingLabel.textColor = LPSColors.white34
        greetingLabel.text = "good morning"
        topHeaderView.addSubview(greetingLabel)
        greetingLabel.topAnchor.constraint(equalTo: topHeaderView.topAnchor, constant: 29).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: topHeaderView.leadingAnchor, constant: 20).isActive = true
        greetingLabel.trailingAnchor.constraint(equalTo: topHeaderView.trailingAnchor, constant: -20).isActive = true
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = LPSFonts.quicksandMedium.of(size: 24.0)
        nameLabel.textColor = LPSColors.white
        nameLabel.text = "Tim Santiago"
        topHeaderView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor).isActive = true
        
        profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 60
        profileImageView.clipsToBounds = true
        topHeaderView.addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: topHeaderView.centerXAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        let leftIcon = MaterialDesignSymbol(text:MaterialDesignIcon.keyboardArrowLeft24px, size:20)
        leftIcon.addAttribute(attributeName: NSAttributedString.Key.foregroundColor, value: UIColor.white)
        let previousMonthButton = UIButton()
        previousMonthButton.translatesAutoresizingMaskIntoConstraints = false
        previousMonthButton.setImage(leftIcon.image(size: CGSize(width: 20, height: 20)), for: .normal)
        topHeaderView.addSubview(previousMonthButton)
        previousMonthButton.bottomAnchor.constraint(equalTo: topHeaderView.bottomAnchor, constant: -20).isActive = true
        previousMonthButton.leadingAnchor.constraint(equalTo: topHeaderView.leadingAnchor, constant: 20).isActive = true
        previousMonthButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        previousMonthButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let rightIcon = MaterialDesignSymbol(text:MaterialDesignIcon.keyboardArrowRight24px, size:20)
        rightIcon.addAttribute(attributeName: NSAttributedString.Key.foregroundColor, value: UIColor.white)
        let nextMonthButton = UIButton()
        nextMonthButton.translatesAutoresizingMaskIntoConstraints = false
        nextMonthButton.setImage(rightIcon.image(size: CGSize(width: 20, height: 20)), for: .normal)
        topHeaderView.addSubview(nextMonthButton)
        nextMonthButton.bottomAnchor.constraint(equalTo: topHeaderView.bottomAnchor, constant: -20).isActive = true
        nextMonthButton.trailingAnchor.constraint(equalTo: topHeaderView.trailingAnchor, constant: -20).isActive = true
        nextMonthButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nextMonthButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        monthButton = UIButton()
        monthButton.translatesAutoresizingMaskIntoConstraints = false
        monthButton.setTitleColor(LPSColors.white, for: .normal)
        monthButton.titleLabel?.font = LPSFonts.quicksandMedium.of(size: 16.0)
        monthButton.setTitle("MARCH", for: .normal)
        topHeaderView.addSubview(monthButton)
        monthButton.centerYAnchor.constraint(equalTo: previousMonthButton.centerYAnchor).isActive = true
        monthButton.leadingAnchor.constraint(equalTo: previousMonthButton.trailingAnchor, constant: 20).isActive = true
        monthButton.trailingAnchor.constraint(equalTo: nextMonthButton.leadingAnchor, constant: -20).isActive = true
        
    }
    
}
