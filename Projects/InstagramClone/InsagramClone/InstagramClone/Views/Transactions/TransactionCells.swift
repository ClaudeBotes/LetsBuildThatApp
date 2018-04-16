//
//  TransactionCell.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class TransactionHeader: GenericCollectionViewCell {
    
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
        let style = StyleSheet(screenName: ApplicationScreen.Transactions.rawValue,
                                         componentName: components.accountBalance.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BalanceAmount.rawValue,
                                           font: UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.primary,
                                           textAlignment: style.TextAlignment())
        return label
    }()
    
    let accountName: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Transactions.rawValue,
                               componentName: components.accountName.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountName.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.secondary,
                                           textAlignment: style.TextAlignment())
        return label
    }()

    let accountNumber: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Transactions.rawValue,
                               componentName: components.accountNumber.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountNumber.rawValue,
                                           font: UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.secondary,
                                           textAlignment:  style.TextAlignment())
        return label
    }()

    let newPaymentButton: StyledButton = {
        let style = StyleSheet(screenName: ApplicationScreen.Transactions.rawValue,
                               componentName: components.newPayment.rawValue)
        let button = StyledButton.createWith( backgroundColor: BrandSpecification.shared.colorPalette.primary,
                                              borderColor: BrandSpecification.shared.colorPalette.primary,
                                              cornerRadius: style.CornerRadius(),
                                              title: style.Title(),
                                              font: UIFont.boldSystemFont(ofSize: style.Font()),
                                              titleColor: BrandSpecification.shared.colorPalette.white,
                                              titleAlignment: style.TextAlignment(),
                                              shadowColor: BrandSpecification.shared.colorPalette.dark,
                                              shadowRadius: style.ShadowRadius(),
                                              shadowOpacity: style.ShadowOpacity(),
                                              shadowOffsetY: style.ShadowOpacity(),
                                              isEnabled: false )
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = BrandSpecification.shared.colorPalette.white
        
        // MARK: Add account name
        addSubview(accountName)
        let accountNameLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                       componentName: components.accountName.rawValue)
        accountName.anchorCenterXToSuperview()
        accountName.anchor(left: nil,
                           top: self.topAnchor,
                           right: nil,
                           bottom: nil,
                           paddingLeft: accountNameLayout.PaddingLeft(),
                           paddingTop: accountNameLayout.PaddingTop(),
                           paddingRight: accountNameLayout.PaddingRight(),
                           paddingBottom: accountNameLayout.PaddingBottom(),
                           width: accountNameLayout.Width(),
                           height: accountNameLayout.Height())
        
        // MARK: Add account balance
        addSubview(accountBalance)
        let availableBalanceLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                            componentName: components.accountBalance.rawValue)
        accountBalance.anchorCenterXToSuperview()
        accountBalance.anchor(left: nil,
                                   top: accountName.bottomAnchor,
                                   right: nil,
                                   bottom: nil,
                                   paddingLeft: availableBalanceLayout.PaddingLeft(),
                                   paddingTop: availableBalanceLayout.PaddingTop(),
                                   paddingRight: availableBalanceLayout.PaddingRight(),
                                   paddingBottom: availableBalanceLayout.PaddingBottom(),
                                   width: availableBalanceLayout.Width(),
                                   height: availableBalanceLayout.Height())
        
        // MARK: Add account number
        addSubview(accountNumber)
        let accountNumberLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                         componentName: components.accountNumber.rawValue)
        accountNumber.anchorCenterXToSuperview()
        accountNumber.anchor(left: nil,
                             top: accountBalance.bottomAnchor,
                             right: nil,
                             bottom: nil,
                             paddingLeft: accountNumberLayout.PaddingLeft(),
                             paddingTop: accountNumberLayout.PaddingTop(),
                             paddingRight: accountNumberLayout.PaddingRight(),
                             paddingBottom: accountNumberLayout.PaddingBottom(),
                             width: accountNumberLayout.Width(),
                             height: accountNumberLayout.Height())
        
        // MARK: Add new payment button
        addSubview(newPaymentButton)
        let newPaymentButtonLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                            componentName: components.newPayment.rawValue)
        newPaymentButton.anchor(left: self.leftAnchor,
                                top: accountNumber.bottomAnchor,
                                right: self.rightAnchor,
                                bottom: nil,
                                paddingLeft: newPaymentButtonLayout.PaddingLeft(),
                                paddingTop: newPaymentButtonLayout.PaddingTop(),
                                paddingRight: newPaymentButtonLayout.PaddingRight(),
                                paddingBottom: newPaymentButtonLayout.PaddingBottom(),
                                width: newPaymentButtonLayout.Width(),
                                height: newPaymentButtonLayout.Height())
    }
}

class TransactionCell: GenericCollectionViewCell {
    
    enum components: String {
        case transactionAvatar = "transactionAvatar"
        case transactionName = "transactionName"
        case transactionAmount = "transactionAmount"
        case rowDevider = "rowDevider"
    }
    
    override var datasourceItem: Any? {
        didSet {
            let transactionItem = datasourceItem as? Transaction
            
            transactionName.text = transactionItem?.name
            
            if let tranName = transactionItem?.name {
                transactionName.text = tranName
            } else {
                transactionName.text = "Transaction Name Unavailable"
            }
        
            if let accounttNumber = transactionItem?.transactionAmount {
                transactionAmount.text = accounttNumber
            } else {
                transactionAmount.text = "Account Number Unavailable"
            }
        }
    }
    
    let transactionAvatar: StyledView = {
        let style = StyleSheet(screenName: ApplicationScreen.Transactions.rawValue,
                               componentName: components.transactionAvatar.rawValue)
        let view = StyledView.createWith(backgroundColor: BrandSpecification.shared.colorPalette.light,
                                         borderColor: BrandSpecification.shared.colorPalette.light,
                                         borderWidth: style.BorderWidth(),
                                         cornerRadius: style.CornerRadius())
        view.clipsToBounds = true
        return view
    }()
    
    let transactionName: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Transactions.rawValue,
                               componentName: components.transactionName.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BenificiaryName.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.primary,
                                           textAlignment: style.TextAlignment())
        return label
    }()
    
    let transactionAmount: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.Transactions.rawValue,
                               componentName: components.transactionAmount.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BalanceAmount.rawValue,
                                           font: UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.secondary,
                                           textAlignment: style.TextAlignment())
        return label
    }()
    
    let rowDevider: StyledView = {
        let view = StyledView()
        view.backgroundColor = BrandSpecification.shared.colorPalette.light
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = BrandSpecification.shared.colorPalette.white
        
        // MARK: Add cotnact name
        addSubview(transactionName)
        let transactionNameLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                             componentName: components.transactionName.rawValue)
        transactionName.anchor(left: self.leftAnchor,
                               top: self.topAnchor,
                               right: self.rightAnchor,
                               bottom: nil,
                               paddingLeft: transactionNameLayout.PaddingLeft(),
                               paddingTop: transactionNameLayout.PaddingTop(),
                               paddingRight: transactionNameLayout.PaddingRight(),
                               paddingBottom: transactionNameLayout.PaddingBottom(),
                               width: transactionNameLayout.Width(),
                               height: transactionNameLayout.Height())
        
        // MARK: Add account number
        addSubview(transactionAmount)
        let transactionAmountLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                      componentName: components.transactionAmount.rawValue)
        transactionAmount.anchor(left: self.leftAnchor,
                                 top: transactionName.bottomAnchor,
                                 right: self.rightAnchor,
                                 bottom: nil,
                                 paddingLeft: transactionAmountLayout.PaddingLeft(),
                                 paddingTop: transactionAmountLayout.PaddingTop(),
                                 paddingRight: transactionAmountLayout.PaddingRight(),
                                 paddingBottom: transactionAmountLayout.PaddingBottom(),
                                 width: transactionAmountLayout.Width(),
                                 height: transactionAmountLayout.Height())
        
        // MARK: Add row devider name
        addSubview(rowDevider)
        let rowDeviderLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                             componentName: components.rowDevider.rawValue)
        rowDevider.anchor(left: self.leftAnchor,
                          top: nil,
                          right: self.rightAnchor,
                          bottom: self.bottomAnchor,
                          paddingLeft: rowDeviderLayout.PaddingLeft(),
                          paddingTop: rowDeviderLayout.PaddingTop(),
                          paddingRight: rowDeviderLayout.PaddingRight(),
                          paddingBottom: rowDeviderLayout.PaddingBottom(),
                          width: rowDeviderLayout.Width(),
                          height: rowDeviderLayout.Height())
        
        // MARK: Add profile picture view
        addSubview(transactionAvatar)
        let transactionAvatarLayout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                             componentName: components.transactionAvatar.rawValue)
        transactionAvatar.anchor(left: self.leftAnchor,
                                 top: self.topAnchor,
                                 right: transactionName.leftAnchor,
                                 bottom: self.bottomAnchor,
                                 paddingLeft: transactionAvatarLayout.PaddingLeft(),
                                 paddingTop: transactionAvatarLayout.PaddingTop(),
                                 paddingRight: transactionAvatarLayout.PaddingRight(),
                                 paddingBottom: transactionAvatarLayout.PaddingBottom(),
                                 width: transactionAvatarLayout.Width(),
                                 height: transactionAvatarLayout.Height())
    }
}

class TransactionFooter: GenericCollectionViewCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = BrandSpecification.shared.colorPalette.white
    }
}
