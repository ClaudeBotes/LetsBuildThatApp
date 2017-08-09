//
//  GenerateTestDataController.swift
//  gameofchats
//
//  Created by Claude on 9/8/2017.
//  Copyright © 2017 letsbuildthatapp. All rights reserved.
//

import UIKit
import Firebase

class GenerateTestDataController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        self.view.addSubview(inputsContainerView)
        setupInputsContainerView()
        
        //view.addSubview(testBankButton)
        //view.addSubview(testTransactionsButton)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: Views
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    var testBankButtonHeightAnchor: NSLayoutConstraint?
    
    lazy var testBankButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green//UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Create Bank", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(createTestBank), for: .touchUpInside)
        
        return button
    }()
    
    var testTransactionsButtonHeightAnchor: NSLayoutConstraint?
    
    lazy var testTransactionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red //UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Create Transactions", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(createTestTransactions), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: Setup Views
    
    func setupInputsContainerView() {
        
        // SET x, y, width, height constraints for input container
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: +50).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: view.frame.height-25)
        inputsContainerViewHeightAnchor?.isActive = true
        inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // ADD BUTTON: Test Bank button views to input container
        // SET x, y, width, height constraints for input container
        // Top constraint
        inputsContainerView.addSubview(testBankButton)
        testBankButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testBankButton.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: +25).isActive = true
        testBankButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        testBankButtonHeightAnchor = testBankButton.heightAnchor.constraint(equalToConstant: 50)
        testBankButtonHeightAnchor?.isActive = true
        
        // ADD BUTTON: Test Transaction button views to input container
        // SET x, y, width, height constraints for input container
        // Top constraint
        inputsContainerView.addSubview(testTransactionsButton)
        testTransactionsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testTransactionsButton.topAnchor.constraint(equalTo: testBankButton.bottomAnchor, constant: +10).isActive = true
        testTransactionsButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        testTransactionsButtonHeightAnchor = testTransactionsButton.heightAnchor.constraint(equalToConstant: 50)
        testTransactionsButtonHeightAnchor?.isActive = true
        
    }
    
    //MARK: Methods
    func createTestBank() {
        print("create some test bank")
    
    }
    
    func createTestTransactions() {
        print("create some test transactions")
        
    }
    
    
        
}
