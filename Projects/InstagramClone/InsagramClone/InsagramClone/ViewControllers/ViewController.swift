//
//  ViewController.swift
//  InsagramClone
//
//  Created by Claude on 30/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let signUpView: SignUpVIew = SignUpVIew()
    
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
        signUpView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }


}

