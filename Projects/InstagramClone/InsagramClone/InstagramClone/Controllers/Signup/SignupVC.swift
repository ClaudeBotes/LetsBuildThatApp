//
//  ViewController.swift
//  InstagramClone
//
//  Created by Claude on 30/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    let signUpView: SignupVIew = SignupVIew()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupSignUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func SetupSignUpView(){
        
        view.addSubview(signUpView)
        signUpView.anchor(left: view.leftAnchor,
                          top: view.topAnchor,
                          right: view.rightAnchor,
                          bottom: view.bottomAnchor,
                          paddingLeft: 0,
                          paddingTop: 0,
                          paddingRight: 0,
                          paddingBottom: 0,
                          width: 0,
                          height: 0)
        
        signUpView.signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        signUpView.emailTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        signUpView.usernameTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        signUpView.passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
    }
    
    @objc func handleTextInputChange() {
        signUpView.handleTextInputChange()
    }
    
    @objc func handleSignUp() {
        print("handleSignUp!")
        
        guard let email = signUpView.emailTextField.text, email.count > 0 else { return }
        guard let username = signUpView.usernameTextField.text, username.count > 0 else { return }
        guard let password = signUpView.passwordTextField.text, password.count > 0 else { return }
        
        UserAPI.shared.signUpNewUser(email: email, username: username, password: password)
    }


}

