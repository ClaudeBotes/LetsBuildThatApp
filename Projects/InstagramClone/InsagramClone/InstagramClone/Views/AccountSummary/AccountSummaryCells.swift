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
                                               shadowColor: BrandSpecification.shared.colorPalette.dark,
                                               shadowRadius: style.ShadowRadius(),
                                               shadowOpacity: style.ShadowOpacity(),
                                               shadowOffsetY: style.ShadowOffsetY())
        return image
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = BrandSpecification.shared.colorPalette.light
        
        addSubview(marketingContent)
        let marketingContentLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.marketingContent.rawValue)
        marketingContent.anchor(left: leftAnchor,
                                top: topAnchor,
                                right: rightAnchor,
                                bottom: bottomAnchor,
                                paddingLeft: marketingContentLayout.PaddingLeft(),
                                paddingTop: marketingContentLayout.PaddingTop(),
                                paddingRight: marketingContentLayout.PaddingRight(),
                                paddingBottom: marketingContentLayout.PaddingBottom(),
                                width: marketingContentLayout.Width(),
                                height: marketingContentLayout.Height())
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
        let card = StyledView.createWith(backgroundColor: BrandSpecification.shared.colorPalette.white,
                                         cornerRadius: style.CornerRadius(),
                                         shadowColor: BrandSpecification.shared.colorPalette.dark,
                                         shadowRadius: style.ShadowRadius(),
                                         shadowOpacity: style.ShadowOpacity(),
                                         shadowOffsetY: style.ShadowOffsetY())
        return card
    }()
    
    let accountName: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                                              componentName: components.accountName.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountName.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.primary,
                                           textAlignment: style.TextAlignment())
        return label
    }()
    
    let openedDate: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.openedDate.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.Date.rawValue,
                                           font:  UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.secondary,
                                           textAlignment: style.TextAlignment())
        return label
    }()
    
    let availableBalance: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.availableBalance.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.BalanceAmount.rawValue,
                                           font: UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.primary,
                                           textAlignment: style.TextAlignment())
        return label
    }()
    
    let accountNumber: StyledLabel = {
        let style = StyleSheet(screenName: ApplicationScreen.AccountSummary.rawValue,
                               componentName: components.accountNumber.rawValue)
        let label = StyledLabel.createWith(text: ValueNotSet.AccountNumber.rawValue,
                                           font: UIFont.systemFont(ofSize: style.Font()),
                                           textColor: BrandSpecification.shared.colorPalette.secondary,
                                           textAlignment:  style.TextAlignment())
        return label
    }()
    
    // MARK: Setup views
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = BrandSpecification.shared.colorPalette.light
        
        // MARK: Add card
        addSubview(accountCard)
        let accountCardLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                       componentName: components.accountCard.rawValue)
        accountCard.anchor(left: leftAnchor,
                           top: topAnchor,
                           right: rightAnchor,
                           bottom: bottomAnchor,
                           paddingLeft: accountCardLayout.PaddingLeft(),
                           paddingTop: accountCardLayout.PaddingTop(),
                           paddingRight: accountCardLayout.PaddingRight(),
                           paddingBottom: accountCardLayout.PaddingBottom(),
                           width: accountCardLayout.Width(),
                           height: accountCardLayout.Height())
        
        // MARK: Add account name
        addSubview(accountName)
        let accountNameLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                   componentName: components.accountName.rawValue)
        accountName.anchor(left: accountCard.leftAnchor,
                                top: accountCard.topAnchor,
                                right: accountCard.rightAnchor,
                                bottom: nil,
                                paddingLeft: accountNameLayout.PaddingLeft(),
                                paddingTop: accountNameLayout.PaddingTop(),
                                paddingRight: accountNameLayout.PaddingRight(),
                                paddingBottom: accountNameLayout.PaddingBottom(),
                                width: accountNameLayout.Width(),
                                height: accountNameLayout.Height())
        
        // MARK: Add available balance
        addSubview(availableBalance)
        let availableBalanceLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                       componentName: components.availableBalance.rawValue)
        availableBalance.anchor(left: accountCard.leftAnchor,
                                     top: accountName.bottomAnchor,
                                     right: accountCard.rightAnchor,
                                     bottom: nil,
                                     paddingLeft: availableBalanceLayout.PaddingLeft(),
                                     paddingTop: availableBalanceLayout.PaddingTop(),
                                     paddingRight: availableBalanceLayout.PaddingRight(),
                                     paddingBottom: availableBalanceLayout.PaddingBottom(),
                                     width: availableBalanceLayout.Width(),
                                     height: availableBalanceLayout.Height())
        
        // MARK: Add account number
        addSubview(accountNumber)
        let accountNumberLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                            componentName: components.accountNumber.rawValue)
        accountNumber.anchor(left: accountCard.leftAnchor,
                                  top: availableBalance.bottomAnchor,
                                  right: accountCard.rightAnchor,
                                  bottom: nil,
                                  paddingLeft: accountNumberLayout.PaddingLeft(),
                                  paddingTop: accountNumberLayout.PaddingTop(),
                                  paddingRight: accountNumberLayout.PaddingRight(),
                                  paddingBottom: accountNumberLayout.PaddingBottom(),
                                  width: accountNumberLayout.Width(),
                                  height: accountNumberLayout.Height())
        
        // MARK: Add date opened
        addSubview(openedDate)
        let openedDateLayout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                         componentName: components.openedDate.rawValue)
        openedDate.anchor(left: nil,
                               top: accountCard.topAnchor,
                               right: accountCard.rightAnchor,
                               bottom: nil,
                               paddingLeft: openedDateLayout.PaddingLeft(),
                               paddingTop: openedDateLayout.PaddingTop(),
                               paddingRight: openedDateLayout.PaddingRight(),
                               paddingBottom: openedDateLayout.PaddingBottom(),
                               width: openedDateLayout.Width(),
                               height: openedDateLayout.Height())
    }
}

class AccountSummaryFooter: GenericCollectionViewCell {
    override func setupViews() {
        super.setupViews()
    }
}
