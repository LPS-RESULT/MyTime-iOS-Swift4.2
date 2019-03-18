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
    
    @objc func signInButtonClicked(sender: UIButton) {
        
    }
    
    func setupViews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [LPSColors.loginBackgroundGradientStart.cgColor, LPSColors.loginBackgroundGradientEnd.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
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
        
        let usernameIcon = UIImageView()
        let personIcon = MaterialDesignSymbol(text:MaterialDesignIcon.person24px, size:20)
        personIcon.addAttribute(attributeName: NSAttributedString.Key.foregroundColor, value: UIColor.white)
        usernameIcon.image = personIcon.image(size: CGSize(width: 20, height: 20))
        usernameIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameIcon)
        usernameIcon.topAnchor.constraint(equalTo: topText.bottomAnchor, constant: 30).isActive = true
        usernameIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        usernameIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        usernameIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let usernameInput = UITextField()
        usernameInput.translatesAutoresizingMaskIntoConstraints = false
        usernameInput.attributedPlaceholder = NSAttributedString(string: "Username",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: LPSColors.white34])
        usernameInput.font = LPSFonts.quicksandMedium.of(size: 16.0)
        usernameInput.autocapitalizationType = .none
        usernameInput.spellCheckingType = .no
        usernameInput.keyboardType = .emailAddress
        usernameInput.textColor = LPSColors.white
        view.addSubview(usernameInput)
        usernameInput.topAnchor.constraint(equalTo: usernameIcon.topAnchor).isActive = true
        usernameInput.bottomAnchor.constraint(equalTo: usernameIcon.bottomAnchor).isActive = true
        usernameInput.leadingAnchor.constraint(equalTo: usernameIcon.trailingAnchor, constant: 8).isActive = true
        usernameInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        let usernameSeparator = UIView()
        usernameSeparator.translatesAutoresizingMaskIntoConstraints = false
        usernameSeparator.backgroundColor = LPSColors.white34
        view.addSubview(usernameSeparator)
        usernameSeparator.topAnchor.constraint(equalTo: usernameIcon.bottomAnchor, constant: 8).isActive = true
        usernameSeparator.leadingAnchor.constraint(equalTo: usernameIcon.leadingAnchor).isActive = true
        usernameSeparator.trailingAnchor.constraint(equalTo: usernameInput.trailingAnchor).isActive = true
        usernameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let passwordIcon = UIImageView()
        let lockIcon = MaterialDesignSymbol(text:MaterialDesignIcon.lock24px, size:20)
        lockIcon.addAttribute(attributeName: NSAttributedString.Key.foregroundColor, value: UIColor.white)
        passwordIcon.image = lockIcon.image(size: CGSize(width: 20, height: 20))
        passwordIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordIcon)
        passwordIcon.topAnchor.constraint(equalTo: usernameSeparator.bottomAnchor, constant: 18).isActive = true
        passwordIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let passwordInput = UITextField()
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: LPSColors.white34])
        passwordInput.font = LPSFonts.quicksandMedium.of(size: 16.0)
        passwordInput.autocapitalizationType = .none
        passwordInput.keyboardType = .asciiCapable
        passwordInput.isSecureTextEntry = true
        passwordInput.textColor = LPSColors.white
        view.addSubview(passwordInput)
        passwordInput.topAnchor.constraint(equalTo: passwordIcon.topAnchor).isActive = true
        passwordInput.bottomAnchor.constraint(equalTo: passwordIcon.bottomAnchor).isActive = true
        passwordInput.leadingAnchor.constraint(equalTo: passwordIcon.trailingAnchor, constant: 8).isActive = true
        passwordInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        let passwordSeparator = UIView()
        passwordSeparator.translatesAutoresizingMaskIntoConstraints = false
        passwordSeparator.backgroundColor = LPSColors.white34
        view.addSubview(passwordSeparator)
        passwordSeparator.topAnchor.constraint(equalTo: passwordIcon.bottomAnchor, constant: 8).isActive = true
        passwordSeparator.leadingAnchor.constraint(equalTo: passwordIcon.leadingAnchor).isActive = true
        passwordSeparator.trailingAnchor.constraint(equalTo: passwordInput.trailingAnchor).isActive = true
        passwordSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let securityCodeIcon = UIImageView()
        let thumbIcon = UIImage(named: "ic_fingerprint")
        securityCodeIcon.image = thumbIcon
        securityCodeIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(securityCodeIcon)
        securityCodeIcon.topAnchor.constraint(equalTo: passwordSeparator.bottomAnchor, constant: 18).isActive = true
        securityCodeIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        securityCodeIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        securityCodeIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let securityCodeInput = UITextField()
        securityCodeInput.translatesAutoresizingMaskIntoConstraints = false
        securityCodeInput.attributedPlaceholder = NSAttributedString(string: "Security Code",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: LPSColors.white34])
        securityCodeInput.font = LPSFonts.quicksandMedium.of(size: 16.0)
        securityCodeInput.autocapitalizationType = .none
        securityCodeInput.keyboardType = .asciiCapable
        securityCodeInput.isSecureTextEntry = true
        securityCodeInput.textColor = LPSColors.white
        view.addSubview(securityCodeInput)
        securityCodeInput.topAnchor.constraint(equalTo: securityCodeIcon.topAnchor).isActive = true
        securityCodeInput.bottomAnchor.constraint(equalTo: securityCodeIcon.bottomAnchor).isActive = true
        securityCodeInput.leadingAnchor.constraint(equalTo: securityCodeIcon.trailingAnchor, constant: 8).isActive = true
        securityCodeInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        let securityCodeSeparator = UIView()
        securityCodeSeparator.translatesAutoresizingMaskIntoConstraints = false
        securityCodeSeparator.backgroundColor = LPSColors.white34
        view.addSubview(securityCodeSeparator)
        securityCodeSeparator.topAnchor.constraint(equalTo: securityCodeIcon.bottomAnchor, constant: 8).isActive = true
        securityCodeSeparator.leadingAnchor.constraint(equalTo: securityCodeIcon.leadingAnchor).isActive = true
        securityCodeSeparator.trailingAnchor.constraint(equalTo: securityCodeInput.trailingAnchor).isActive = true
        securityCodeSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let signInRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.signInButtonClicked(sender:)))
        
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.layer.cornerRadius = 4
        signInButton.backgroundColor = LPSColors.primary
        signInButton.addGestureRecognizer(signInRecognizer)
        view.addSubview(signInButton)
        signInButton.topAnchor.constraint(equalTo: securityCodeSeparator.bottomAnchor, constant: 32).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: securityCodeSeparator.leadingAnchor).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: securityCodeSeparator.trailingAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
}
