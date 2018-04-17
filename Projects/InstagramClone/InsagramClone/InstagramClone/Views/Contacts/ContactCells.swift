//
//  ContactCell.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit



class ContactHeader: GenericTableViewCell {
    
    enum components: String {
        case accountBalance = "accountBalance"
        case accountName = "accountName"
        case accountNumber = "accountNumber"
        case newPayment = "newPayment"
    }
    
    // This is a hack to fix a bug in ios11 where the scrollbar appears behind the collectionview header
    // Bug does not appear in ios10
    override class var layerClass: AnyClass {
        get { return CustomLayer.self }
    }
    
    let accountBalance: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Contacts.rawValue,
                               componentName: components.accountBalance.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BalanceAmount.rawValue,
                                           font: UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.primary,
                                           textAlignment: style.textAlignment)
        return label
    }()
    
    let accountName: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Contacts.rawValue,
                               componentName: components.accountName.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountName.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.secondary,
                                           textAlignment: style.textAlignment)
        return label
    }()
    
    let accountNumber: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Contacts.rawValue,
                               componentName: components.accountNumber.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountNumber.rawValue,
                                           font: UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.secondary,
                                           textAlignment:  style.textAlignment)
        return label
    }()
    
    let newPaymentButton: StyledButton = {
        let style = StyleSheet(screenName: ApplicationScreen.Contacts.rawValue,
                               componentName: components.newPayment.rawValue)
        let button = StyledButton.createWith( backgroundColor: Brand.shared.colorPalette.primary,
                                              borderColor: Brand.shared.colorPalette.primary,
                                              cornerRadius: style.cornerRadius,
                                              title: style.title,
                                              font: UIFont.boldSystemFont(ofSize: style.fontSize),
                                              titleColor: Brand.shared.colorPalette.white,
                                              titleAlignment: style.textAlignment,
                                              shadowColor: Brand.shared.colorPalette.dark,
                                              shadowRadius: style.shadowRadius,
                                              shadowOpacity: style.shadowOpacity,
                                              shadowOffsetY: style.shadowOpacity,
                                              isEnabled: false )
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = Brand.shared.colorPalette.white
        
        // MARK: Add account name
        addSubview(accountName)
        let accountNameLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                       componentName: components.accountName.rawValue)
        accountName.anchorCenterXToSuperview()
        accountName.anchor(left: nil,
                           top: self.topAnchor,
                           right: nil,
                           bottom: nil,
                           paddingLeft: accountNameLayout.paddingLeft,
                           paddingTop: accountNameLayout.paddingTop,
                           paddingRight: accountNameLayout.paddingRight,
                           paddingBottom: accountNameLayout.paddingBottom,
                           width: accountNameLayout.width,
                           height: accountNameLayout.height)
        
        // MARK: Add account balance
        addSubview(accountBalance)
        let availableBalanceLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                            componentName: components.accountBalance.rawValue)
        accountBalance.anchorCenterXToSuperview()
        accountBalance.anchor(left: nil,
                              top: accountName.bottomAnchor,
                              right: nil,
                              bottom: nil,
                              paddingLeft: availableBalanceLayout.paddingLeft,
                              paddingTop: availableBalanceLayout.paddingTop,
                              paddingRight: availableBalanceLayout.paddingRight,
                              paddingBottom: availableBalanceLayout.paddingBottom,
                              width: availableBalanceLayout.width,
                              height: availableBalanceLayout.height)
        
        // MARK: Add account number
        addSubview(accountNumber)
        let accountNumberLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                         componentName: components.accountNumber.rawValue)
        accountNumber.anchorCenterXToSuperview()
        accountNumber.anchor(left: nil,
                             top: accountBalance.bottomAnchor,
                             right: nil,
                             bottom: nil,
                             paddingLeft: accountNumberLayout.paddingLeft,
                             paddingTop: accountNumberLayout.paddingTop,
                             paddingRight: accountNumberLayout.paddingRight,
                             paddingBottom: accountNumberLayout.paddingBottom,
                             width: accountNumberLayout.width,
                             height: accountNumberLayout.height)
        
        // MARK: Add new payment button
        addSubview(newPaymentButton)
        let newPaymentButtonLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                            componentName: components.newPayment.rawValue)
        newPaymentButton.anchor(left: self.leftAnchor,
                                top: accountNumber.bottomAnchor,
                                right: self.rightAnchor,
                                bottom: nil,
                                paddingLeft: newPaymentButtonLayout.paddingLeft,
                                paddingTop: newPaymentButtonLayout.paddingTop,
                                paddingRight: newPaymentButtonLayout.paddingRight,
                                paddingBottom: newPaymentButtonLayout.paddingBottom,
                                width: newPaymentButtonLayout.width,
                                height: newPaymentButtonLayout.height)
    }
}

class ContactCell: GenericTableViewCell {
    
    enum components: String {
        case transactionAvatar = "transactionAvatar"
        case transactionName = "transactionName"
        case transactionAmount = "transactionAmount"
        case rowDevider = "rowDevider"
    }
    
    override var datasourceItem: Any? {
        didSet {
            let ContactItem = datasourceItem as? Contact
            
            transactionName.text = ContactItem?.name
            
            if let tranName = ContactItem?.name {
                transactionName.text = tranName
            } else {
                transactionName.text = "Transaction Name Unavailable"
            }
            
            if let accounttNumber = ContactItem?.accountNumber {
                transactionAmount.text = accounttNumber
            } else {
                transactionAmount.text = "Account Number Unavailable"
            }
        }
    }
    
    let transactionAvatar: StyledView = {
        let style = StyleSheet(screenName: ApplicationScreen.Contacts.rawValue,
                               componentName: components.transactionAvatar.rawValue)
        let view = StyledView.createWith(backgroundColor: Brand.shared.colorPalette.light,
                                         borderColor: Brand.shared.colorPalette.light,
                                         borderWidth: style.borderWidth,
                                         cornerRadius: style.cornerRadius)
        view.clipsToBounds = true
        return view
    }()
    
    let transactionName: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Contacts.rawValue,
                               componentName: components.transactionName.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BenificiaryName.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.primary,
                                           textAlignment: style.textAlignment)
        return label
    }()
    
    let transactionAmount: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Contacts.rawValue,
                               componentName: components.transactionAmount.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BalanceAmount.rawValue,
                                           font: UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.secondary,
                                           textAlignment: style.textAlignment)
        return label
    }()
    
    let rowDevider: StyledView = {
        let view = StyledView()
        view.backgroundColor = Brand.shared.colorPalette.light
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = Brand.shared.colorPalette.white
        
        // MARK: Add cotnact name
        addSubview(transactionName)
        let transactionNameLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                           componentName: components.transactionName.rawValue)
        transactionName.anchor(left: self.leftAnchor,
                               top: self.topAnchor,
                               right: self.rightAnchor,
                               bottom: nil,
                               paddingLeft: transactionNameLayout.paddingLeft,
                               paddingTop: transactionNameLayout.paddingTop,
                               paddingRight: transactionNameLayout.paddingRight,
                               paddingBottom: transactionNameLayout.paddingBottom,
                               width: transactionNameLayout.width,
                               height: transactionNameLayout.height)
        
        // MARK: Add account number
        addSubview(transactionAmount)
        let transactionAmountLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                             componentName: components.transactionAmount.rawValue)
        transactionAmount.anchor(left: self.leftAnchor,
                                 top: transactionName.bottomAnchor,
                                 right: self.rightAnchor,
                                 bottom: nil,
                                 paddingLeft: transactionAmountLayout.paddingLeft,
                                 paddingTop: transactionAmountLayout.paddingTop,
                                 paddingRight: transactionAmountLayout.paddingRight,
                                 paddingBottom: transactionAmountLayout.paddingBottom,
                                 width: transactionAmountLayout.width,
                                 height: transactionAmountLayout.height)
        
        // MARK: Add row devider name
        addSubview(rowDevider)
        let rowDeviderLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                      componentName: components.rowDevider.rawValue)
        rowDevider.anchor(left: self.leftAnchor,
                          top: nil,
                          right: self.rightAnchor,
                          bottom: self.bottomAnchor,
                          paddingLeft: rowDeviderLayout.paddingLeft,
                          paddingTop: rowDeviderLayout.paddingTop,
                          paddingRight: rowDeviderLayout.paddingRight,
                          paddingBottom: rowDeviderLayout.paddingBottom,
                          width: rowDeviderLayout.width,
                          height: rowDeviderLayout.height)
        
        // MARK: Add profile picture view
        addSubview(transactionAvatar)
        let transactionAvatarLayout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                                             componentName: components.transactionAvatar.rawValue)
        transactionAvatar.anchor(left: self.leftAnchor,
                                 top: self.topAnchor,
                                 right: transactionName.leftAnchor,
                                 bottom: self.bottomAnchor,
                                 paddingLeft: transactionAvatarLayout.paddingLeft,
                                 paddingTop: transactionAvatarLayout.paddingTop,
                                 paddingRight: transactionAvatarLayout.paddingRight,
                                 paddingBottom: transactionAvatarLayout.paddingBottom,
                                 width: transactionAvatarLayout.width,
                                 height: transactionAvatarLayout.height)
    }
}

class ContactFooter: GenericTableViewCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = Brand.shared.colorPalette.white
    }
}
