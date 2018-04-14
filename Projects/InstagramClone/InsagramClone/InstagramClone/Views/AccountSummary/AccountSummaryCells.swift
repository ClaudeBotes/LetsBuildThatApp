//
//  AccountCell.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class AccountSummaryFooter: GenericCollectionViewCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}

class AccountSummaryHeader: GenericCollectionViewCell {
    
    let marketingContent: StyledImageView = {
        let image = StyledImageView()
        image.image = #imageLiteral(resourceName: "marketing banner")
        image.shadowColor =  AccountSummaryTheme.MarketingContentStyle.BackgroundColor()
        image.shadowOpacity = AccountSummaryTheme.MarketingContentStyle.ShadowOpacity()
        image.shadowRadius = AccountSummaryTheme.MarketingContentStyle.ShadowRadius()
        image.shadowOffsetY = AccountSummaryTheme.MarketingContentStyle.ShadowOffsetY()
        return image
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = AccountSummaryTheme.shared.CellBackgroundColor()
        
        addSubview(marketingContent)
        marketingContent.anchor(left: leftAnchor,
                                top: topAnchor,
                                right: rightAnchor,
                                bottom: bottomAnchor,
                                paddingLeft: AccountSummaryTheme.MarketingContentLayout.PaddingLeft(),
                                paddingTop: AccountSummaryTheme.MarketingContentLayout.PaddingTop(),
                                paddingRight: AccountSummaryTheme.MarketingContentLayout.PaddingRight(),
                                paddingBottom: AccountSummaryTheme.MarketingContentLayout.PaddingBottom(),
                                width: AccountSummaryTheme.MarketingContentLayout.Width(),
                                height: AccountSummaryTheme.MarketingContentLayout.Height())
    }
}

class AccountSummaryCell: GenericCollectionViewCell {
    
    var product: Product?
    
    // MARK: Set label values from data source
    
    override var datasourceItem: Any? {
        didSet {
            
            let productItem = datasourceItem as? Product
            self.product = productItem
            
            accountNameLabel.text = productItem?.alias
            
            if let accountName = productItem?.alias {
                accountNameLabel.text = accountName
            } else {
                accountNameLabel.text = "Account Name Unavailable"
            }
            
            if let availableBalance = productItem?.availableBalance {
                availableBalanceLabel.text = availableBalance
            } else {
                availableBalanceLabel.text = "Available Balance Unavailable"
            }
            
            if let accountNumber = productItem?.accountNumber {
                accountNumberLabel.text = accountNumber
            } else {
                accountNumberLabel.text = "Account Number Unavailable"
            }
            
            if let dateOpened = productItem?.dateOpened {
                openedDateLabel.text = dateOpened
            } else {
                openedDateLabel.text = "Opening Date Unavailable"
            }
        }
    }
    
    // MARK: Create UI elements
    
    let accountCard: StyledView = {
        let card = StyledView()
        card.cornerRadius = AccountSummaryTheme.CardStyle.CornerRadius()
        card.shadowColor = AccountSummaryTheme.CardStyle.ShadowColor()
        card.shadowOpacity = AccountSummaryTheme.CardStyle.ShadowOpacity()
        card.shadowRadius = AccountSummaryTheme.CardStyle.ShadowRadius()
        card.shadowOffsetY = AccountSummaryTheme.CardStyle.ShadowOffsetY()
        card.backgroundColor = AccountSummaryTheme.CardStyle.BackgroundColor()
        return card
    }()
    
    let accountNameLabel: StyledLabel = {
        let label = StyledLabel()
        label.text = "1234 1234 1234 1234"
        label.font = UIFont.systemFont(ofSize: AccountSummaryLabelStyles.shared.AccountNameFont())
        label.textColor = AccountSummaryLabelStyles.shared.AccountNameColor()
        label.textAlignment = AccountSummaryLabelStyles.shared.AccountNameTextAlignment()
        return label
    }()
    
    let openedDateLabel: StyledLabel = {
        let label = StyledLabel()
        label.text = "01 / 2018"
        label.font = UIFont.systemFont(ofSize: AccountSummaryLabelStyles.shared.OpenedDateFont())
        label.textColor = AccountSummaryLabelStyles.shared.OpenedDateColor()
        label.textAlignment = AccountSummaryLabelStyles.shared.OpenedDateTextAlignment()
        return label
    }()
    
    let availableBalanceLabel: StyledLabel = {
        let label = StyledLabel()
        label.text = "1234"
        label.font = UIFont.systemFont(ofSize: AccountSummaryLabelStyles.shared.AvailableBalanceFont())
        label.textColor = AccountSummaryLabelStyles.shared.AvailableBalanceColor()
        label.textAlignment = AccountSummaryLabelStyles.shared.AvailableBalanceTextAlignment()
        return label
    }()
    
    let accountNumberLabel: StyledLabel = {
        let label = StyledLabel()
        label.text = "**** **** **** ****"
        label.font = UIFont.systemFont(ofSize: AccountSummaryLabelStyles.shared.AccountNumberFont())
        label.textColor = AccountSummaryLabelStyles.shared.AccountNumberColor()
        label.textAlignment = AccountSummaryLabelStyles.shared.AccountNumberTextAlignment()
        return label
    }()
    
    // MARK: Setup views
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = AccountSummaryTheme.shared.CellBackgroundColor()
        
        // MARK: Add card
        addSubview(accountCard)
        accountCard.anchor(left: leftAnchor,
                           top: topAnchor,
                           right: rightAnchor,
                           bottom: bottomAnchor,
                           paddingLeft: AccountSummaryTheme.CardLayout.PaddingLeft(),
                           paddingTop: AccountSummaryTheme.CardLayout.PaddingTop(),
                           paddingRight: AccountSummaryTheme.CardLayout.PaddingRight(),
                           paddingBottom: AccountSummaryTheme.CardLayout.PaddingBottom(),
                           width: AccountSummaryTheme.CardLayout.Width(),
                           height: AccountSummaryTheme.CardLayout.Height())
        
        // MARK: Add account name
        addSubview(accountNameLabel)
        accountNameLabel.anchor(left: accountCard.leftAnchor,
                                top: accountCard.topAnchor,
                                right: accountCard.rightAnchor,
                                bottom: nil,
                                paddingLeft: AccountSummaryTheme.AccountNumberLayout.PaddingLeft(),
                                paddingTop: AccountSummaryTheme.AccountNumberLayout.PaddingTop(),
                                paddingRight: AccountSummaryTheme.AccountNumberLayout.PaddingRight(),
                                paddingBottom: AccountSummaryTheme.AccountNumberLayout.PaddingBottom(),
                                width: AccountSummaryTheme.AccountNumberLayout.Width(),
                                height: AccountSummaryTheme.AccountNumberLayout.Height())
        
        // MAR: Add available balance
        addSubview(availableBalanceLabel)
        availableBalanceLabel.anchor(left: accountCard.leftAnchor,
                                     top: accountNameLabel.bottomAnchor,
                                     right: accountCard.rightAnchor,
                                     bottom: nil,
                                     paddingLeft: AccountSummaryTheme.AvailableBalanceLayout.PaddingLeft(),
                                     paddingTop: AccountSummaryTheme.AvailableBalanceLayout.PaddingTop(),
                                     paddingRight: AccountSummaryTheme.AvailableBalanceLayout.PaddingRight(),
                                     paddingBottom: AccountSummaryTheme.AvailableBalanceLayout.PaddingBottom(),
                                     width: AccountSummaryTheme.AvailableBalanceLayout.Width(),
                                     height: AccountSummaryTheme.AvailableBalanceLayout.Height())
        
        // MARK: Add account number
        addSubview(accountNumberLabel)
        accountNumberLabel.anchor(left: accountCard.leftAnchor,
                                  top: availableBalanceLabel.bottomAnchor,
                                  right: accountCard.rightAnchor,
                                  bottom: nil,
                                  paddingLeft: AccountSummaryTheme.AccountNumberLayout.PaddingLeft(),
                                  paddingTop: AccountSummaryTheme.AccountNumberLayout.PaddingTop(),
                                  paddingRight: AccountSummaryTheme.AccountNumberLayout.PaddingRight(),
                                  paddingBottom: AccountSummaryTheme.AccountNumberLayout.PaddingBottom(),
                                  width: AccountSummaryTheme.AccountNumberLayout.Width(),
                                  height: AccountSummaryTheme.AccountNumberLayout.Height())
        
        // MARK: Add date opened
        addSubview(openedDateLabel)
        openedDateLabel.anchor(left: nil,
                               top: accountCard.topAnchor,
                               right: accountCard.rightAnchor,
                               bottom: nil,
                               paddingLeft: AccountSummaryTheme.OpenedDateLayout.PaddingLeft(),
                               paddingTop: AccountSummaryTheme.OpenedDateLayout.PaddingTop(),
                               paddingRight: AccountSummaryTheme.OpenedDateLayout.PaddingRight(),
                               paddingBottom: AccountSummaryTheme.OpenedDateLayout.PaddingBottom(),
                               width: AccountSummaryTheme.OpenedDateLayout.Width(),
                               height: AccountSummaryTheme.OpenedDateLayout.Height())
        
    }
}
