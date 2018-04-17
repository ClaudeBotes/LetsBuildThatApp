//
//  AccountCell.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class AccountSummaryHeader: GenericCollectionViewCell {
    
    enum components: String {
        case marketingContent = "marketingContent"
    }
    
    // This is a hack to fix a bug in ios11 where the scrollbar appears behind the collectionview header
    // Bug does not appear in ios10
    override class var layerClass: AnyClass {
        get { return CustomLayer.self }
    }
    
    let marketingContent: StyledImageView = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.marketingContent.rawValue)
        let image = StyledImageView.createWith(image: #imageLiteral(resourceName: "marketing banner"),
                                               shadowColor: Brand.shared.colorPalette.dark,
                                               shadowRadius: style.shadowRadius,
                                               shadowOpacity: style.shadowOpacity,
                                               shadowOffsetY: style.shadowOffsetY)
        return image
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = Brand.shared.colorPalette.light
        
        addSubview(marketingContent)
        let marketingContentLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.marketingContent.rawValue)
        marketingContent.anchor(left: leftAnchor,
                                top: topAnchor,
                                right: rightAnchor,
                                bottom: bottomAnchor,
                                paddingLeft: marketingContentLayout.paddingLeft,
                                paddingTop: marketingContentLayout.paddingTop,
                                paddingRight: marketingContentLayout.paddingRight,
                                paddingBottom: marketingContentLayout.paddingBottom,
                                width: marketingContentLayout.width,
                                height: marketingContentLayout.height)
    }
}

class AccountSummaryCell: GenericCollectionViewCell {
    
    enum components: String {
        case availableBalance = "availableBalance"
        case accountName = "accountName"
        case accountNumber = "accountNumber"
        case openedDate = "openedDate"
        case accountCard = "accountCard"
        case marketingContent = "marketingContent"
    }
    
    var product: Product?
    // TODO: CLean this part up more
    // MARK: Set label values from data source
    
    override var datasourceItem: Any? {
        didSet {
            
            let productItem = datasourceItem as? Product
            self.product = productItem
            
            accountName.text = productItem?.alias
            
            if let alias = productItem?.alias {
                accountName.text = alias
            } else {
                accountName.text = "Account Name Unavailable"
            }
            
            if let availBalance = productItem?.availableBalance {
                availableBalance.text = availBalance
            } else {
                availableBalance.text = "Available Balance Unavailable"
            }
            
            if let accNumber = productItem?.accountNumber {
                accountNumber.text = accNumber
            } else {
                accountNumber.text = "Account Number Unavailable"
            }
            
            if let dateOpened = productItem?.dateOpened {
                openedDate.text = dateOpened
            } else {
                openedDate.text = "Opening Date Unavailable"
            }
        }
    }
    
    // MARK: Create UI elements
    
    let accountCard: StyledView = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                                   componentName: components.accountCard.rawValue)
        let card = StyledView.createWith(backgroundColor: Brand.shared.colorPalette.white,
                                         cornerRadius: style.cornerRadius,
                                         shadowColor: Brand.shared.colorPalette.dark,
                                         shadowRadius: style.shadowRadius,
                                         shadowOpacity: style.shadowOpacity,
                                         shadowOffsetY: style.shadowOffsetY)
        return card
    }()
    
    let accountName: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                                              componentName: components.accountName.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountName.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.primary,
                                           textAlignment: style.textAlignment)
        return label
    }()
    
    let openedDate: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.openedDate.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.Date.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.secondary,
                                           textAlignment: style.textAlignment)
        return label
    }()
    
    let availableBalance: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.availableBalance.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BalanceAmount.rawValue,
                                           font: UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.primary,
                                           textAlignment: style.textAlignment)
        return label
    }()
    
    let accountNumber: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.accountNumber.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountNumber.rawValue,
                                           font: UIFont.systemFont(ofSize: style.fontSize),
                                           textColor: Brand.shared.colorPalette.secondary,
                                           textAlignment:  style.textAlignment)
        return label
    }()
    
    // MARK: Setup views
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = Brand.shared.colorPalette.light
        
        // MARK: Add card
        addSubview(accountCard)
        let accountCardLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                       componentName: components.accountCard.rawValue)
        accountCard.anchor(left: leftAnchor,
                           top: topAnchor,
                           right: rightAnchor,
                           bottom: bottomAnchor,
                           paddingLeft: accountCardLayout.paddingLeft,
                           paddingTop: accountCardLayout.paddingTop,
                           paddingRight: accountCardLayout.paddingRight,
                           paddingBottom: accountCardLayout.paddingBottom,
                           width: accountCardLayout.width,
                           height: accountCardLayout.height)
        
        // MARK: Add account name
        addSubview(accountName)
        let accountNameLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                   componentName: components.accountName.rawValue)
        accountName.anchor(left: accountCard.leftAnchor,
                                top: accountCard.topAnchor,
                                right: accountCard.rightAnchor,
                                bottom: nil,
                                paddingLeft: accountNameLayout.paddingLeft,
                                paddingTop: accountNameLayout.paddingTop,
                                paddingRight: accountNameLayout.paddingRight,
                                paddingBottom: accountNameLayout.paddingBottom,
                                width: accountNameLayout.width,
                                height: accountNameLayout.height)
        
        // MARK: Add available balance
        addSubview(availableBalance)
        let availableBalanceLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                       componentName: components.availableBalance.rawValue)
        availableBalance.anchor(left: accountCard.leftAnchor,
                                     top: accountName.bottomAnchor,
                                     right: accountCard.rightAnchor,
                                     bottom: nil,
                                     paddingLeft: availableBalanceLayout.paddingLeft,
                                     paddingTop: availableBalanceLayout.paddingTop,
                                     paddingRight: availableBalanceLayout.paddingRight,
                                     paddingBottom: availableBalanceLayout.paddingBottom,
                                     width: availableBalanceLayout.width,
                                     height: availableBalanceLayout.height)
        
        // MARK: Add account number
        addSubview(accountNumber)
        let accountNumberLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                            componentName: components.accountNumber.rawValue)
        accountNumber.anchor(left: accountCard.leftAnchor,
                                  top: availableBalance.bottomAnchor,
                                  right: accountCard.rightAnchor,
                                  bottom: nil,
                                  paddingLeft: accountNumberLayout.paddingLeft,
                                  paddingTop: accountNumberLayout.paddingTop,
                                  paddingRight: accountNumberLayout.paddingRight,
                                  paddingBottom: accountNumberLayout.paddingBottom,
                                  width: accountNumberLayout.width,
                                  height: accountNumberLayout.height)
        
        // MARK: Add date opened
        addSubview(openedDate)
        let openedDateLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                         componentName: components.openedDate.rawValue)
        openedDate.anchor(left: nil,
                               top: accountCard.topAnchor,
                               right: accountCard.rightAnchor,
                               bottom: nil,
                               paddingLeft: openedDateLayout.paddingLeft,
                               paddingTop: openedDateLayout.paddingTop,
                               paddingRight: openedDateLayout.paddingRight,
                               paddingBottom: openedDateLayout.paddingBottom,
                               width: openedDateLayout.width,
                               height: openedDateLayout.height)
    }
}

class AccountSummaryFooter: GenericCollectionViewCell {
    override func setupViews() {
        super.setupViews()
    }
}
