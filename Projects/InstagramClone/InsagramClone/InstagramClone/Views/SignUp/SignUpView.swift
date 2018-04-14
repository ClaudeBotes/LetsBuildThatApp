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
    
    let logo: StyledView = {
        let view = StyledView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: SignUpTheme.AssetNames.CompanyLogo())!)
        return view
    }()
    
    let emailTextField: StyledTextField = {
        
        let textField = StyledTextField.createWith(font:UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize()),
                                                       textColor: SignUpTheme.Colors.TextFieldTextColor(),
                                                       placeholderText: "Email",
                                                       placeholderTextColor: SignUpTheme.Colors.TextFieldPlaceholderTextColor(),
                                                       cornerRadius: SignUpTheme.TextFieldStyle.CornerRadius(),
                                                       borderWidth: SignUpTheme.TextFieldStyle.BorderWidth(),
                                                       borderColor: SignUpTheme.Colors.TextFieldBackgroundColor(),
                                                       leftPadding: SignUpTheme.TextFieldStyle.TextFieldPadding(),
                                                       rightPadding: SignUpTheme.TextFieldStyle.TextFieldPadding(),
                                                       backgroundColor: SignUpTheme.Colors.TextFieldBackgroundColor())
        
        return textField
    }()
    
    let usernameTextField: StyledTextField = {
        
        let textField = StyledTextField.createWith(font:UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize()),
                                                       textColor: SignUpTheme.Colors.TextFieldTextColor(),
                                                       placeholderText: "Username",
                                                       placeholderTextColor: SignUpTheme.Colors.TextFieldPlaceholderTextColor(),
                                                       cornerRadius: SignUpTheme.TextFieldStyle.CornerRadius(),
                                                       borderWidth: SignUpTheme.TextFieldStyle.BorderWidth(),
                                                       borderColor: SignUpTheme.Colors.TextFieldBackgroundColor(),
                                                       leftPadding: SignUpTheme.TextFieldStyle.TextFieldPadding(),
                                                       rightPadding: SignUpTheme.TextFieldStyle.TextFieldPadding(),
                                                       backgroundColor: SignUpTheme.Colors.TextFieldBackgroundColor())
        return textField
    }()
    
    let passwordTextField: StyledTextField = {
        
        let textField = StyledTextField.createWith(font:UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize()),
                                                       textColor: SignUpTheme.Colors.TextFieldTextColor(),
                                                       placeholderText: "Password",
                                                       placeholderTextColor: SignUpTheme.Colors.TextFieldPlaceholderTextColor(),
                                                       cornerRadius: SignUpTheme.TextFieldStyle.CornerRadius(),
                                                       borderWidth: SignUpTheme.TextFieldStyle.BorderWidth(),
                                                       borderColor: SignUpTheme.Colors.TextFieldBackgroundColor(),
                                                       leftPadding: SignUpTheme.TextFieldStyle.TextFieldPadding(),
                                                       rightPadding: SignUpTheme.TextFieldStyle.TextFieldPadding(),
                                                       backgroundColor: SignUpTheme.Colors.TextFieldBackgroundColor())
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signUpButton: StyledButton = {
        let button = StyledButton.createWith(
                           backgroundColor: SignUpTheme.Colors.SignUpButtonBackgroundColor().withAlphaComponent(0.5),
                           borderColor: SignUpTheme.Colors.SignUpButtonBackgroundColor().withAlphaComponent(0.5),
                           cornerRadius: SignUpTheme.SignUpButtonStyle.CornerRadius(),
                           title: "Sign Up",
                           font: UIFont.systemFont(ofSize: SignUpTheme.TextFieldStyle.FontSize()),
                           titleColor: SignUpTheme.Colors.SignUpButtonTextColor().withAlphaComponent(0.5),
                           titleAlignment: .center,
                           isEnabled: false )
        
        return button
    }()
    
    private func setupSubViews(){
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: SignUpTheme.AssetNames.BackgroundImage())!)
        
        // Add usernameTextField to view
        
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
            signUpButton.backgroundColor = SignUpTheme.Colors.SignUpButtonBackgroundColor()
            signUpButton.setTitleColor(SignUpTheme.Colors.SignUpButtonTextColor(), for: .normal)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = SignUpTheme.Colors.SignUpButtonBackgroundColor().withAlphaComponent(0.5)
            signUpButton.setTitleColor(SignUpTheme.Colors.SignUpButtonTextColor().withAlphaComponent(0.5), for: .normal)
        }
    }
}
