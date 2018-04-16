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
    
    // This is a hack to fix a bug in ios11 where the scrollbar appears behind the collectionview header
    // Bug does not appear in ios10
    override class var layerClass: AnyClass {
        get { return CustomLayer.self }
    }
    
    let marketingContent: StyledImageView = {
        let image = StyledImageView.createWith(image: #imageLiteral(resourceName: "marketing banner"),
                                               shadowColor: AccSumMarketingContentStyle.shared.ShadowColor(),
                                               shadowRadius: AccSumMarketingContentStyle.shared.ShadowRadius(),
                                               shadowOpacity: AccSumMarketingContentStyle.shared.ShadowOpacity(),
                                               shadowOffsetY: AccSumMarketingContentStyle.shared.ShadowOffsetY())
        return image
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = AccSumHeaderStyle.shared.BackgroundColor()
        
        addSubview(marketingContent)
        marketingContent.anchor(left: leftAnchor,
                                top: topAnchor,
                                right: rightAnchor,
                                bottom: bottomAnchor,
                                paddingLeft: AccSumMarketingContentStyle.shared.PaddingLeft(),
                                paddingTop: AccSumMarketingContentStyle.shared.PaddingTop(),
                                paddingRight: AccSumMarketingContentStyle.shared.PaddingRight(),
                                paddingBottom: AccSumMarketingContentStyle.shared.PaddingBottom(),
                                width: AccSumMarketingContentStyle.shared.Width(),
                                height: AccSumMarketingContentStyle.shared.Height())
    }
}

class AccountSummaryCell: GenericCollectionViewCell {
    
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
        let card = StyledView.createWith(backgroundColor: AccSumAccountCardStyle.shared.BackgroundColor(),
                                         cornerRadius: AccSumAccountCardStyle.shared.CornerRadius(),
                                         shadowColor: AccSumAccountCardStyle.shared.ShadowColor(),
                                         shadowRadius: AccSumAccountCardStyle.shared.ShadowRadius(),
                                         shadowOpacity: AccSumAccountCardStyle.shared.ShadowOpacity(),
                                         shadowOffsetY: AccSumAccountCardStyle.shared.ShadowOffsetY())
        
        return card
    }()
    
    let accountName: StyledLabel = {
        let label = StyledLabel.createWith(text: ValueNotSet.AccountName.rawValue,
                                           font:  UIFont.systemFont(ofSize: AccSumAccountNameStyle.shared.Font()),
                                           textColor: AccSumAccountNameStyle.shared.TextColor(),
                                           textAlignment: AccSumAccountNameStyle.shared.TextAlignment())
        return label
    }()
    
    let openedDate: StyledLabel = {
        let label = StyledLabel.createWith(text: ValueNotSet.Date.rawValue,
                                           font:  UIFont.systemFont(ofSize: AccSumOpenedDateStyle.shared.Font()),
                                           textColor: AccSumOpenedDateStyle.shared.TextColor(),
                                           textAlignment: AccSumOpenedDateStyle.shared.TextAlignment())
        return label
    }()
    
    let availableBalance: StyledLabel = {
        let label = StyledLabel.createWith(text: ValueNotSet.BalanceAmount.rawValue,
                                           font: UIFont.systemFont(ofSize: AccSumAvailableBalanceStyle.shared.Font()),
                                           textColor: AccSumAvailableBalanceStyle.shared.TextColor(),
                                           textAlignment: AccSumAvailableBalanceStyle.shared.TextAlignment())
        return label
    }()
    
    let accountNumber: StyledLabel = {
        let label = StyledLabel.createWith(text: ValueNotSet.AccountNumber.rawValue,
                                           font: UIFont.systemFont(ofSize: AccSumAccountNumberStyle.shared.Font()),
                                           textColor: AccSumAccountNumberStyle.shared.TextColor(),
                                           textAlignment:  AccSumAccountNumberStyle.shared.TextAlignment())
        return label
    }()
    
    // MARK: Setup views
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = AccSumCellStyle.shared.BackgroundColor()
        
        // MARK: Add card
        addSubview(accountCard)
        accountCard.anchor(left: leftAnchor,
                           top: topAnchor,
                           right: rightAnchor,
                           bottom: bottomAnchor,
                           paddingLeft: AccSumAccountCardStyle.shared.PaddingLeft(),
                           paddingTop: AccSumAccountCardStyle.shared.PaddingTop(),
                           paddingRight: AccSumAccountCardStyle.shared.PaddingRight(),
                           paddingBottom: AccSumAccountCardStyle.shared.PaddingBottom(),
                           width: AccSumAccountCardStyle.shared.Width(),
                           height: AccSumAccountCardStyle.shared.Height())
        
        // MARK: Add account name
        addSubview(accountName)
        accountName.anchor(left: accountCard.leftAnchor,
                                top: accountCard.topAnchor,
                                right: accountCard.rightAnchor,
                                bottom: nil,
                                paddingLeft: AccSumAccountNameStyle.shared.PaddingLeft(),
                                paddingTop: AccSumAccountNameStyle.shared.PaddingTop(),
                                paddingRight: AccSumAccountNameStyle.shared.PaddingRight(),
                                paddingBottom: AccSumAccountNameStyle.shared.PaddingBottom(),
                                width: AccSumAccountNameStyle.shared.Width(),
                                height: AccSumAccountNameStyle.shared.Height())
        
        // MAR: Add available balance
        addSubview(availableBalance)
        availableBalance.anchor(left: accountCard.leftAnchor,
                                     top: accountName.bottomAnchor,
                                     right: accountCard.rightAnchor,
                                     bottom: nil,
                                     paddingLeft: AccSumAvailableBalanceStyle.shared.PaddingLeft(),
                                     paddingTop: AccSumAvailableBalanceStyle.shared.PaddingTop(),
                                     paddingRight: AccSumAvailableBalanceStyle.shared.PaddingRight(),
                                     paddingBottom: AccSumAvailableBalanceStyle.shared.PaddingBottom(),
                                     width: AccSumAvailableBalanceStyle.shared.Width(),
                                     height: AccSumAvailableBalanceStyle.shared.Height())
        
        // MARK: Add account number
        addSubview(accountNumber)
        accountNumber.anchor(left: accountCard.leftAnchor,
                                  top: availableBalance.bottomAnchor,
                                  right: accountCard.rightAnchor,
                                  bottom: nil,
                                  paddingLeft: AccSumAccountNumberStyle.shared.PaddingLeft(),
                                  paddingTop: AccSumAccountNumberStyle.shared.PaddingTop(),
                                  paddingRight: AccSumAccountNumberStyle.shared.PaddingRight(),
                                  paddingBottom: AccSumAccountNumberStyle.shared.PaddingBottom(),
                                  width: AccSumAccountNumberStyle.shared.Width(),
                                  height: AccSumAccountNumberStyle.shared.Height())
        
        // MARK: Add date opened
        addSubview(openedDate)
        openedDate.anchor(left: nil,
                               top: accountCard.topAnchor,
                               right: accountCard.rightAnchor,
                               bottom: nil,
                               paddingLeft: AccSumOpenedDateStyle.shared.PaddingLeft(),
                               paddingTop: AccSumOpenedDateStyle.shared.PaddingTop(),
                               paddingRight: AccSumOpenedDateStyle.shared.PaddingRight(),
                               paddingBottom: AccSumOpenedDateStyle.shared.PaddingBottom(),
                               width: AccSumOpenedDateStyle.shared.Width(),
                               height: AccSumOpenedDateStyle.shared.Height())
    }
}

class AccountSummaryFooter: GenericCollectionViewCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}
