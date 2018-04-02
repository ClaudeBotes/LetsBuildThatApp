//
//  SignUpView.swift
//  InstagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class SignupVIew: UIView {
    
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
        view.backgroundColor = UIColor(patternImage: UIImage(named: SignUpTheme.AssetNames.CompanyLogo())!)
        return view
    }()
    
    let emailTextField: DesignableTextField = {
        let textField = DesignableTextField()
        textField.font = UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize())
        textField.textColor = SignUpTheme.Colors.TextFieldTextColor()
        textField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes: [NSAttributedStringKey.foregroundColor: SignUpTheme.Colors.TextFieldPlaceholderTextColor()])
        textField.cornerRadius = SignUpTheme.TextFieldStyle.CornerRadius()
        textField.borderWidth = SignUpTheme.TextFieldStyle.BorderWidth()
        textField.leftPadding = SignUpTheme.TextFieldStyle.TextFieldPadding()
        textField.rightPadding = SignUpTheme.TextFieldStyle.TextFieldPadding()
        textField.backgroundColor = SignUpTheme.Colors.TextFieldBackgroundColor()
        textField.borderColor = SignUpTheme.Colors.TextFieldBackgroundColor()
        //textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    let usernameTextField: DesignableTextField = {
        let textField = DesignableTextField()
        textField.font = UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize())
        textField.textColor = ApplicationTheme.Colors.White()
        textField.attributedPlaceholder = NSAttributedString(string: "Username",
                                                             attributes: [NSAttributedStringKey.foregroundColor: SignUpTheme.Colors.TextFieldPlaceholderTextColor()])
        textField.cornerRadius = SignUpTheme.TextFieldStyle.CornerRadius()
        textField.borderWidth = SignUpTheme.TextFieldStyle.BorderWidth()
        textField.leftPadding = SignUpTheme.TextFieldStyle.TextFieldPadding()
        textField.rightPadding = SignUpTheme.TextFieldStyle.TextFieldPadding()
        textField.backgroundColor = SignUpTheme.Colors.TextFieldBackgroundColor()
        textField.borderColor = SignUpTheme.Colors.TextFieldBackgroundColor()
        //textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    let passwordTextField: DesignableTextField = {
        let textField = DesignableTextField()
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize())
        textField.textColor = ApplicationTheme.Colors.White()
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes: [NSAttributedStringKey.foregroundColor: SignUpTheme.Colors.TextFieldPlaceholderTextColor()])
        textField.cornerRadius = SignUpTheme.TextFieldStyle.CornerRadius()
        textField.borderWidth = SignUpTheme.TextFieldStyle.BorderWidth()
        textField.leftPadding = SignUpTheme.TextFieldStyle.TextFieldPadding()
        textField.rightPadding = SignUpTheme.TextFieldStyle.TextFieldPadding()
        textField.backgroundColor = SignUpTheme.Colors.TextFieldBackgroundColor()
        textField.borderColor = SignUpTheme.Colors.TextFieldBackgroundColor()
        //textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    let signUpButton: DesignableButton = {
        let button = DesignableButton()
        button.backgroundColor =  SignUpTheme.Colors.SignUpButtonColor().withAlphaComponent(0.5)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize())
        button.cornerRadius = SignUpTheme.SignUpButtonStyle.CornerRadius()
        button.setTitleColor(SignUpTheme.Colors.SignUpButtonTextColor().withAlphaComponent(0.5), for: .normal)
        button.isEnabled = false
        return button
    }()
    
    private func setupSubViews(){
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: SignUpTheme.AssetNames.BackgroundImage())!)
        
        // Logo
        
        self.addSubview(logo)
        logo.anchor(left: self.leftAnchor, top: self.topAnchor, right: nil, bottom: nil, paddingLeft: 23, paddingTop: 70, paddingRight: 0, paddingBottom: 0, width: 180, height: 50)
        
        // StackView
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        self.addSubview(stackView)
        
        stackView.anchor(left: self.leftAnchor, top: nil, right: self.rightAnchor, bottom: self.bottomAnchor, paddingLeft: 23, paddingTop: 0, paddingRight: 25, paddingBottom: 25, width: 0, height: 210)
    }
    
    func handleTextInputChange() {
        
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = SignUpTheme.Colors.SignUpButtonColor()
            signUpButton.setTitleColor(SignUpTheme.Colors.SignUpButtonTextColor(), for: .normal)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = SignUpTheme.Colors.SignUpButtonColor().withAlphaComponent(0.5)
            signUpButton.setTitleColor(SignUpTheme.Colors.SignUpButtonTextColor().withAlphaComponent(0.5), for: .normal)
        }
    }
}
