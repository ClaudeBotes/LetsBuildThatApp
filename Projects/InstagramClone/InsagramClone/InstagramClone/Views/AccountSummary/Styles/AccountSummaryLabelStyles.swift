//
//  AccountSummaryLabelStyles.swift
//  InstagramClone
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

// MARK: Account Summary Label Styles
final class AccountSummaryLabelStyles {

    enum LabelNames: String {
        case availableBalance = "availableBalance"
        case accountName = "accountName"
        case accountNumber = "accountNumber"
        case openedDate = "openedDate"
    }
    
    static let shared = AccountSummaryLabelStyles()
    
    private var accountNameTextStyle = DesignSpecificationForTextStyle()
    private var accountNumberTextStyle = DesignSpecificationForTextStyle()
    private var openedDateTextStyle = DesignSpecificationForTextStyle()
    private var availableBalanceTextStyle = DesignSpecificationForTextStyle()
    
    var screenStyle = DesignSpecificationForScreen()
    
    private init() {
        setDesignSpecForScreen()
    }

    // MARK: Account Name Label Style
    
    func AccountNameFont() -> CGFloat {
        return self.accountNameTextStyle.fontSize
    }
    func AccountNameColor() -> UIColor {
        return UIColor(hex: ApplicationTheme.Colors.PrimaryColor2String())
    }
    func AccountNameTextAlignment() -> NSTextAlignment {
        return self.accountNameTextStyle.textAlighnment
    }
    
    // MARK: Account Number Style
    
    func AccountNumberFont() -> CGFloat {
        return self.accountNumberTextStyle.fontSize
    }
    func AccountNumberColor() -> UIColor {
        return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
    }
    func AccountNumberTextAlignment() -> NSTextAlignment {
        return self.accountNumberTextStyle.textAlighnment
    }
    
    // MARK: Opened Date Style
    
    func OpenedDateFont() -> CGFloat {
        return self.openedDateTextStyle.fontSize
    }
    func OpenedDateColor() -> UIColor {
        return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
    }
    func OpenedDateTextAlignment() -> NSTextAlignment {
        return self.openedDateTextStyle.textAlighnment
    }
    
    // MARK: Available Balance Style
    
    func AvailableBalanceFont() -> CGFloat {
        return self.availableBalanceTextStyle.fontSize
    }
    func AvailableBalanceColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.primary
    }
    func AvailableBalanceTextAlignment() -> NSTextAlignment {
        return self.availableBalanceTextStyle.textAlighnment
    }
    
    // MARK: Private Functions
    
    private func setStyleForAccountName(textStyle: DesignSpecificationForTextStyle) {
        self.accountNameTextStyle = textStyle
        self.accountNameTextStyle.textColor = BrandSpecification.shared.colorPalette.secondary
    }
    
    private func setStyleForAccountNumber(textStyle: DesignSpecificationForTextStyle) {
        self.accountNumberTextStyle = textStyle
        self.accountNumberTextStyle.textColor = BrandSpecification.shared.colorPalette.secondary
    }
    
    private func setStyleForOpenedDate(textStyle: DesignSpecificationForTextStyle){
        self.openedDateTextStyle = textStyle
        self.openedDateTextStyle.textColor = BrandSpecification.shared.colorPalette.secondary
    }
    
    private func setStyleForAvailableBalance(textStyle: DesignSpecificationForTextStyle) {
        self.availableBalanceTextStyle = textStyle
        self.availableBalanceTextStyle.textColor = BrandSpecification.shared.colorPalette.primary
    }
    
    private func setDesignSpecForScreen(){
        let accountSummaryDesignSpec = getDesignSpecForScreen(screenName: Screens.AccountSummary.rawValue)
        
        // Check that it is not default values from creation
        if accountSummaryDesignSpec.screenName != DefaultComponentValues.ScreenName.rawValue {
            
            // Loop through each design spec for labels on this screen
            for label in accountSummaryDesignSpec.labels {
                
                switch label.name {
                case LabelNames.accountName.rawValue:
                    setStyleForAccountName(textStyle: label.style)
                case LabelNames.accountNumber.rawValue:
                    setStyleForAccountNumber(textStyle: label.style)
                case LabelNames.availableBalance.rawValue:
                    setStyleForAvailableBalance(textStyle: label.style)
                case LabelNames.openedDate.rawValue:
                    setStyleForOpenedDate(textStyle: label.style)
                default:
                    print("No label styles found")
                }
            }
        }
    }
}
