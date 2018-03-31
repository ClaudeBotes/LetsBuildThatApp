//
//  SignUpView.swift
//  InsagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class SignUpVIew: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setupSubViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
    }
    
    convenience init(text: String) {
        self.init()
    }
    
    let logo: DesignableView = {
        let view = DesignableView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bank-logo")!)
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
        
    }()
    
    let emailTextField: DesignableTextField = {
        let textField = DesignableTextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes: [NSAttributedStringKey.foregroundColor: ApplicationTheme.Colors.LightGray()])
        textField.cornerRadius = 4
        textField.borderWidth = 1
        textField.leftPadding = 15
        textField.rightPadding = 15
        textField.backgroundColor = ApplicationTheme.Colors.PrimaryColor2()
        textField.borderColor = ApplicationTheme.Colors.PrimaryColor2()
        //textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    let usernameTextField: DesignableTextField = {
        let textField = DesignableTextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Username",
                                                             attributes: [NSAttributedStringKey.foregroundColor: ApplicationTheme.Colors.LightGray()])
        textField.cornerRadius = 4
        textField.borderWidth = 1
        textField.leftPadding = 15
        textField.rightPadding = 15
        textField.backgroundColor = ApplicationTheme.Colors.PrimaryColor2()
        textField.borderColor = ApplicationTheme.Colors.PrimaryColor2()
        //textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    let passwordTextField: DesignableTextField = {
        let textField = DesignableTextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes: [NSAttributedStringKey.foregroundColor: ApplicationTheme.Colors.LightGray()])
        textField.cornerRadius = 4
        textField.borderWidth = 1
        textField.leftPadding = 15
        textField.rightPadding = 15
        textField.backgroundColor = ApplicationTheme.Colors.PrimaryColor2()
        textField.borderColor = ApplicationTheme.Colors.PrimaryColor2()
        //textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    let signUpButton: DesignableButton = {
        let button = DesignableButton()
        button.backgroundColor =  ApplicationTheme.Colors.PrimaryColor1()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.cornerRadius = 4
        button.borderWidth = 1
        button.borderColor = ApplicationTheme.Colors.PrimaryColor1()
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private func setupSubViews(){
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "signup-background")!)
        
        // Logo
        
        self.addSubview(logo)
        logo.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 70, paddingLeft: 23, paddingBottom: 0, paddingRight: 0, width: 180, height: 50)
        
        // StackView
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        self.addSubview(stackView)
        
        stackView.anchor(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 23, paddingBottom: 25, paddingRight: 25, width: 0, height: 230)
        
        
    }
}
