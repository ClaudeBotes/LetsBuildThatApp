//
//  TransactionCell.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class TransactionFooter: GenericCollectionViewCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
    }
}

class TransactionHeader: GenericCollectionViewCell {
    
    // This is a hack to fix a bug in ios11 where the scrollbar appears behind the collectionview header
    // Bug does not appear in ios10
    override class var layerClass: AnyClass {
        get { return CustomLayer.self }
    }
    
    let accountBalanceLabel: StyledLabel = {
        let label = StyledLabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = ApplicationTheme.Colors.PrimaryColor2()
        label.text = "€ 1.356,90"
        return label
    }()
    
    let accountNameLabel: StyledLabel = {
        let label = StyledLabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = TransactionCellTheme.Colors.AccountNameColor()
        label.text = "Check Account"
        return label
    }()

    
    let accountNumberLabel: StyledLabel = {
        let label = StyledLabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = TransactionCellTheme.Colors.AccountNumberColor()
        label.text = "NL90 BANK 1234 5678 90"
        return label
    }()

    let newPaymentButton: StyledButton = {
        let button = StyledButton.createWith(
            backgroundColor: TransactionCellTheme.Colors.NewPaymentButtonBackgroundColor(),
            borderColor: TransactionCellTheme.Colors.NewPaymentButtonBackgroundColor(),
            cornerRadius: TransactionCellTheme.NewPaymentButtonStyle.CornerRadius(),
            title: "New Payment",
            font: UIFont.boldSystemFont(ofSize: TransactionCellTheme.NewPaymentButtonStyle.FontSize()),
            titleColor: TransactionCellTheme.Colors.NewPaymentButtonTextColor(),
            titleAlignment: .center,
            isEnabled: false )

        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = ApplicationTheme.Colors.White()
        
        // Add account name
        
        addSubview(accountNameLabel)
        accountNameLabel.anchorCenterXToSuperview()
        accountNameLabel.anchor(left: nil, top: self.topAnchor, right: nil, bottom: nil, paddingLeft: 0, paddingTop: 3, paddingRight: 0, paddingBottom: 0, width: 0, height: 20)
        
        // Add account balance
        
        addSubview(accountBalanceLabel)
        accountBalanceLabel.anchorCenterXToSuperview()
        accountBalanceLabel.anchor(left: nil, top: accountNameLabel.bottomAnchor, right: nil, bottom: nil, paddingLeft: 0, paddingTop: 3, paddingRight: 0, paddingBottom: 0, width: 0, height: 41)
        
        // Add account number
        
        addSubview(accountNumberLabel)
        accountNumberLabel.anchorCenterXToSuperview()
        accountNumberLabel.anchor(left: nil, top: accountBalanceLabel.bottomAnchor, right: nil, bottom: nil, paddingLeft: 0, paddingTop: 3, paddingRight: 0, paddingBottom: 0, width: 0, height: 20)
        
        // Add new payment button
        
        addSubview(newPaymentButton)
        newPaymentButton.anchor(left: self.leftAnchor, top: accountNumberLabel.bottomAnchor, right: self.rightAnchor, bottom: nil, paddingLeft: 16, paddingTop: 16, paddingRight: 16, paddingBottom: 16, width: 0, height: 44)
    }
}

class TransactionCell: GenericCollectionViewCell {
    
    override var datasourceItem: Any? {
        didSet {
            let transactionItem = datasourceItem as? Transaction
            
            transactionNameLabel.text = transactionItem?.name
            
            if let transactionName = transactionItem?.name {
                transactionNameLabel.text = transactionName
            } else {
                transactionNameLabel.text = "Transaction Name Unavailable"
            }
        
            if let accounttNumber = transactionItem?.transactionAmount {
                transactionAmount.text = accounttNumber
            } else {
                transactionAmount.text = "Account Number Unavailable"
            }
        }
    }
    
    let transactionAvatar: StyledView = {
        let view = StyledView()
        view.cornerRadius = 16.6 // width / 2 to make a view round
        view.clipsToBounds = true
        view.borderWidth = 1
        view.borderColor = ApplicationTheme.Colors.LightGray().withAlphaComponent(0.5)
        view.backgroundColor = ApplicationTheme.Colors.LightGray().withAlphaComponent(0.5)
        
        return view
    }()
    
    let transactionNameLabel: StyledLabel = {
        let label = StyledLabel()
        label.font = UIFont.systemFont(ofSize: TransactionCellTheme.TextFieldStyle.TransactionNameFont())
        label.textColor = TransactionCellTheme.Colors.TransactionNameColor()
        label.text = "John Steward"
        label.textAlignment = .left
        return label
    }()
    
    let transactionAmount: StyledLabel = {
        let label = StyledLabel()
        label.font = UIFont.systemFont(ofSize: TransactionCellTheme.TextFieldStyle.TransactionAmountFont())
        label.textColor = TransactionCellTheme.Colors.TransactionAmountColor()
        label.text = "-9.87"
        label.textAlignment = .left
        return label
    }()
    
    let rowDevider: StyledView = {
        let view = StyledView()
        view.backgroundColor = TransactionTheme.Colors.RowSeperatorColor()
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = TransactionCellTheme.Colors.CellBackgroundColor()
        
        // Add cotnact name
        
        addSubview(transactionNameLabel)
        transactionNameLabel.anchor(left: self.leftAnchor, top: self.topAnchor, right: self.rightAnchor, bottom: nil, paddingLeft: 65, paddingTop: 8, paddingRight: 15, paddingBottom: 0, width: 0, height: 20)
        
        // Add account number
        
        addSubview(transactionAmount)
        transactionAmount.anchor(left: self.leftAnchor, top: transactionNameLabel.bottomAnchor, right: self.rightAnchor, bottom: nil, paddingLeft: 65, paddingTop: 3, paddingRight: 15, paddingBottom: 0, width: 0, height: 28)
        
        // Add row devider name
        addSubview(rowDevider)
        rowDevider.anchor(left: self.leftAnchor, top: nil, right: self.rightAnchor, bottom: self.bottomAnchor, paddingLeft: 65, paddingTop: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        
        // Add profile picture view
        
        addSubview(transactionAvatar)
        transactionAvatar.anchor(left: self.leftAnchor, top: self.topAnchor, right: transactionNameLabel.leftAnchor, bottom: self.bottomAnchor, paddingLeft: 16, paddingTop: 14, paddingRight: 16, paddingBottom: 14, width: 0, height: 0)
    }
}
