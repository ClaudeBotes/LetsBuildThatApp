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
    
    let companyLogo: DesignableImageView = {
        let image = DesignableImageView()
        image.image = #imageLiteral(resourceName: "bank-logo-small")
        return image
    }()
    
    let marketingContent: DesignableImageView = {
        let image = DesignableImageView()
        image.image = #imageLiteral(resourceName: "marketing banner")
        image.shadowColor =  AccountSuymmaryCellTheme.Colors.CardShadowColor()
        image.shadowOpacity = 0.15
        image.shadowRadius = 2
        image.shadowOffsetY = 3
        return image
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = AccountSuymmaryCellTheme.Colors.CellBackgroundColor()
        
        addSubview(marketingContent)
        marketingContent.anchor(left: leftAnchor, top: topAnchor, right: rightAnchor, bottom: bottomAnchor, paddingLeft: 0, paddingTop: 0, paddingRight: 0, paddingBottom: 5, width: 0, height: 0)
        
        //addSubview(companyLogo)
        //companyLogo.anchor(left: centerXAnchor, top: topAnchor, right: nil, bottom: bottomAnchor, paddingLeft: -12.5, paddingTop: 16, paddingRight: 0, paddingBottom: 6, width: 25, height: 28)
    }
}

class AccountSummaryCell: GenericCollectionViewCell {
    
    override var datasourceItem: Any? {
        didSet {
            let accountItem = datasourceItem as? Account
           

            accountNameLabel.text = accountItem?.name
            
            if let accountName = accountItem?.name {
                accountNameLabel.text = accountName
            } else {
                accountNameLabel.text = "Account Name Unavailable"
            }
            
            if let availableBalance = accountItem?.availableBalance {
                availableBalanceLabel.text = availableBalance
            } else {
                availableBalanceLabel.text = "Available Balance Unavailable"
            }
            
            if let balanceColor = accountItem?.color {
                availableBalanceLabel.textColor = UIColor(hex: balanceColor)
            } else {
                availableBalanceLabel.textColor = AccountSuymmaryCellTheme.Colors.AccountNameColor()
            }
            
            if let accountNumber = accountItem?.accountNumber {
                accountNumberLabel.text = accountNumber
            } else {
                accountNumberLabel.text = "Account Number Unavailable"
            }
            
            if let dateOpened = accountItem?.dateOpened {
                openedDateLabel.text = dateOpened
            } else {
                openedDateLabel.text = "Opening Date Unavailable"
            }
        }
    }
    
    let accountCard: DesignableView = {
        let card = DesignableView()
        card.cornerRadius = AccountSuymmaryCellTheme.CardStyle.CornerRadius()
        card.shadowColor = AccountSuymmaryCellTheme.Colors.CardShadowColor()
        card.shadowOpacity = 0.15
        card.shadowRadius = 2
        card.shadowOffsetY = 3
        card.backgroundColor = AccountSuymmaryCellTheme.Colors.CardColor()
        return card
    }()
    
    let accountNameLabel: DesignableLabel = {
        let label = DesignableLabel()
        label.font = UIFont.systemFont(ofSize: AccountSuymmaryCellTheme.LabelStyle.AccountNameFont())
        label.textColor = AccountSuymmaryCellTheme.Colors.AccountNameColor()
        label.text = "1234 1234 1234 1234"
        label.textAlignment = .left
        return label
    }()
    
    let openedDateLabel: DesignableLabel = {
        let label = DesignableLabel()
        label.font = UIFont.systemFont(ofSize: AccountSuymmaryCellTheme.LabelStyle.AccountNumberFont())
        label.textColor = AccountSuymmaryCellTheme.Colors.AccountNumberColor()
        label.text = "01 / 2018"
        label.textAlignment = .right
        return label
    }()
    
    let availableBalanceLabel: DesignableLabel = {
        let label = DesignableLabel()
        label.font = UIFont.systemFont(ofSize: AccountSuymmaryCellTheme.LabelStyle.AvailableBalanceFont())
        label.textColor = AccountSuymmaryCellTheme.Colors.AccountNameColor()
        label.text = "1234"
        label.textAlignment = .left
        return label
    }()
    
    let accountNumberLabel: DesignableLabel = {
        let label = DesignableLabel()
        label.font = UIFont.systemFont(ofSize: AccountSuymmaryCellTheme.LabelStyle.AccountNumberFont())
        label.textColor = AccountSuymmaryCellTheme.Colors.AccountNumberColor()
        label.text = "**** **** **** ****"
        label.textAlignment = .left
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = AccountSuymmaryCellTheme.Colors.CellBackgroundColor()
        
        // Add card
        
        addSubview(accountCard)
        accountCard.anchor(left: leftAnchor, top: topAnchor, right: rightAnchor, bottom: bottomAnchor, paddingLeft: 18, paddingTop: 9, paddingRight: 19, paddingBottom: 10, width: 0, height: 0)
        
        // Add account name
        
        addSubview(accountNameLabel)
        accountNameLabel.anchor(left: accountCard.leftAnchor, top: accountCard.topAnchor, right: accountCard.rightAnchor, bottom: nil, paddingLeft: 15, paddingTop: 25, paddingRight: 15, paddingBottom: 0, width: 0, height: 20)
        
        // Add available balance
        
        addSubview(availableBalanceLabel)
        availableBalanceLabel.anchor(left: accountCard.leftAnchor, top: accountNameLabel.bottomAnchor, right: accountCard.rightAnchor, bottom: nil, paddingLeft: 15, paddingTop: 7, paddingRight: 15, paddingBottom: 0, width: 0, height: 28)
        
        // Add account number
        
        addSubview(accountNumberLabel)
        accountNumberLabel.anchor(left: accountCard.leftAnchor, top: availableBalanceLabel.bottomAnchor, right: accountCard.rightAnchor, bottom: nil, paddingLeft: 15, paddingTop: 20, paddingRight: 15, paddingBottom: 0, width: 0, height: 18)
        
        // Add date opened
        
        addSubview(openedDateLabel)
        openedDateLabel.anchor(left: nil, top: accountCard.topAnchor, right: accountCard.rightAnchor, bottom: nil, paddingLeft: 15, paddingTop: 25, paddingRight: 15, paddingBottom: 0, width: 0, height: 18)
        
    }
}
