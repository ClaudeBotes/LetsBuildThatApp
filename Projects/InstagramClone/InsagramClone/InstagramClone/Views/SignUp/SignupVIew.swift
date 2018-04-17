//
//  SignupVIew.swift
//  InstagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class SignupVIew: UIView {
    
    enum components: String {
        case logo = "logo"
        case textFields = "textFieldsForSignUp"
        case usernameTextField = "usernameTextField"
        case passwordTextField = "passwordTextField"
        case signUpButton = "signUpButton"
        case signUpStack = "signUpStack"
        case screen = "screen"
    }
    
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
        let style = StyleSheet(screenName: ApplicationScreen.SignUp.rawValue,
                               componentName: components.logo.rawValue)
        if let image = UIImage(named: style.assetName){
             view.backgroundColor = UIColor(patternImage: image)
        }else{
            view.backgroundColor = Brand.shared.colorPalette.light
        }
        
        return view
    }()
    
    let emailTextField: StyledTextField = {
        var style = StyleSheet(screenName: ApplicationScreen.SignUp.rawValue,
                               componentName: components.textFields.rawValue)
        let textField = getTextFieldForSignUp(placeHolderText: "Email", style: &style, enabled: true)

        return textField
    }()
    
    let usernameTextField: StyledTextField = {
        var style = StyleSheet(screenName: ApplicationScreen.SignUp.rawValue,
                               componentName: components.textFields.rawValue)
        let textField = getTextFieldForSignUp(placeHolderText: "Username", style: &style, enabled: true)
        return textField
    }()
    
    let passwordTextField: StyledTextField = {
        var style = StyleSheet(screenName: ApplicationScreen.SignUp.rawValue,
                               componentName: components.textFields.rawValue)
        let textField = getTextFieldForSignUp(placeHolderText: "Password", style: &style, enabled: true)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signUpButton: StyledButton = {
        
        var style = StyleSheet(screenName: ApplicationScreen.SignUp.rawValue,
                               componentName: components.signUpButton.rawValue)
        let button = getStyledButton(style: &style, enabled: false)
        return button
    }()
    
    private func setupSubViews(){
        
        self.backgroundColor = setBackgroundImage(style: StyleSheet(screenName: ApplicationScreen.SignUp.rawValue,
                                                                    componentName: components.screen.rawValue))
     
        // MARK: Add logo
        self.addSubview(logo)
        let logoLayout = Layout(screenName: ApplicationScreen.SignUp.rawValue,
                                       componentName: components.logo.rawValue)
        logo.anchor(left: self.leftAnchor,
                    top: self.topAnchor,
                    right: nil,
                    bottom: nil,
                    paddingLeft: logoLayout.paddingLeft,
                    paddingTop: logoLayout.paddingTop,
                    paddingRight: logoLayout.paddingRight,
                    paddingBottom: logoLayout.paddingBottom,
                    width: logoLayout.width,
                    height: logoLayout.height)
        
        // MARK: Add StackView
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        self.addSubview(stackView)
        
        let stackViewLayout = Layout(screenName: ApplicationScreen.SignUp.rawValue,
                                componentName: components.signUpStack.rawValue)
        stackView.anchor(left: self.leftAnchor,
                         top: nil,
                         right: self.rightAnchor,
                         bottom: self.bottomAnchor,
                         paddingLeft: stackViewLayout.paddingLeft,
                         paddingTop: stackViewLayout.paddingTop,
                         paddingRight: stackViewLayout.paddingRight,
                         paddingBottom: stackViewLayout.paddingBottom,
                         width: stackViewLayout.width,
                         height: stackViewLayout.height)
    }
    
    func handleTextInputChange() {
        
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = Brand.shared.colorPalette.primary
            signUpButton.setTitleColor(Brand.shared.colorPalette.white, for: .normal)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = Brand.shared.colorPalette.primary.withAlphaComponent(0.5)
            signUpButton.setTitleColor(Brand.shared.colorPalette.white.withAlphaComponent(0.5), for: .normal)
        }
    }
}
