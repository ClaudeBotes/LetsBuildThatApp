//
//  AccountSummaryTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit


// MARK: Account Summary Label Styles
final class AccountSummaryLabelStyles {
    
    static let shared = AccountSummaryLabelStyles()
    var accountNameTextStyle = TextStyleTemplate()
    var accountNumberTextStyle = TextStyleTemplate()
    var openedDateTextStyle = TextStyleTemplate()
    var availablebalanceTextStyle = TextStyleTemplate()
    
    private init() {
        configureStyleForAccountName()
        configureStyleForAccountNumber()
        configureStyleForOpenedDate()
        configureStyleForAvailableBalance()
    }
    
    private func configureStyleForAccountName() {
       
        // Read data from JSON here
        
        accountNameTextStyle = TextStyleTemplate(fontSize: 13.0,
                                                 textColor: UIColor(hex: ApplicationTheme.Colors.PrimaryColor2String()),
                                                 textAlignment: NSTextAlignment.left)
    }
    
    private func configureStyleForAccountNumber() {
        
        // Read data from JSON here
        
        accountNumberTextStyle = TextStyleTemplate(fontSize: 13.0,
                                                   textColor: UIColor(hex: ApplicationTheme.Colors.LightGrayString()),
                                                   textAlignment: NSTextAlignment.left)
    }
    
    private func configureStyleForOpenedDate(){
        
        // Read data from JSON here
        
        openedDateTextStyle = TextStyleTemplate(fontSize: 13.0,
                                                textColor: UIColor(hex: ApplicationTheme.Colors.LightGrayString()),
                                                textAlignment: NSTextAlignment.right)
    }
    
    private func configureStyleForAvailableBalance() {
        
        
        
        
        let jsonData = AccountSummaryStyleJSONReader.shared.GetTextStyleJSONData()  as? [TextStyleFromJSON]
        
        if let fontSize = jsonData![0].fontSize {
            availablebalanceTextStyle.fontSize = fontSize
        }
        
        if let textColor = jsonData![0].textColor {
            availablebalanceTextStyle.textColor = UIColor(hex: textColor)
        }
        
        if let textAlignment = jsonData![0].textAlighnment {
            availablebalanceTextStyle.textAlighnment = setTextAlignment(textAlignment: textAlignment)
        }
    }
    
    // MARK: Account Name Label Style
    
    func AccountNameFont() -> CGFloat {
        return self.accountNameTextStyle.fontSize
    }
    func AccountNameColor() -> UIColor {
        return self.accountNameTextStyle.textColor
    }
    func AccountNameTextAlignment() -> NSTextAlignment {
        return self.accountNameTextStyle.textAlighnment
    }
    
    // MARK: Account Number Style
    
    func AccountNumberFont() -> CGFloat {
        return self.accountNumberTextStyle.fontSize
    }
    func AccountNumberColor() -> UIColor {
        return self.accountNumberTextStyle.textColor
    }
    func AccountNumberTextAlignment() -> NSTextAlignment {
        return self.accountNumberTextStyle.textAlighnment
    }
    
    // MARK: Opened Date Style

    func OpenedDateFont() -> CGFloat {
        return self.openedDateTextStyle.fontSize
    }
    func OpenedDateColor() -> UIColor {
        return self.openedDateTextStyle.textColor
    }
    func OpenedDateTextAlignment() -> NSTextAlignment {
        return self.openedDateTextStyle.textAlighnment
    }
    
    // MARK: Available Balance Style

    func AvailableBalanceFont() -> CGFloat {
        return self.availablebalanceTextStyle.fontSize
    }
    func AvailableBalanceColor() -> UIColor {
        return self.availablebalanceTextStyle.textColor
    }
    func AvailableBalanceTextAlignment() -> NSTextAlignment {
        return self.availablebalanceTextStyle.textAlighnment
    }
}


final class AccountSummaryTheme {
    
    // 1
    static let shared = AccountSummaryTheme()
    
    // 2
    private init() {}
    
    func CellBackgroundColor() -> UIColor {
        return UIColor(hex: ApplicationTheme.Colors.PrimaryColor3String())
    }
    
    // Mark: MarketingContentStyle
     struct MarketingContentStyle {
        
        // Read data from JSON
        
        static let style = StyleTemplate(shadowRadius: 2.0,
                                         shadowOpacity: 0.15,
                                         shadowOffsetY: 3.0,
                                         shadowColor: UIColor(hex: ApplicationTheme.Colors.CardShadowString()),
                                         cornerRadius: 0.0,
                                         borderWidth: 0.0,
                                         backgroundColor: UIColor(hex: ApplicationTheme.Colors.PrimaryColor3String()))
        
        static func ShadowRadius() -> CGFloat {
            return style.shadowRadius
        }
        static func ShadowOpacity() -> CGFloat {
            return style.shadowOpacity
        }
        static func ShadowOffsetY() -> CGFloat {
            return style.shadowOffsetY
        }
        static func MarketingContentShadow() -> UIColor {
            return style.shadowColor
        }
        static func BackgroundColor() -> UIColor {
            return style.backgroundColor
        }
    }
    
    // MARK: MarketingContentLayout
    struct MarketingContentLayout {
        
        // Read data from JSON
        
        static let layout = LayoutTemplate(paddingLeft: 0,
                                           paddingTop: 0,
                                           paddingRight: 0,
                                           paddingBottom: 5,
                                           width: 0,
                                           height: 0)
        
        static func PaddingLeft() -> CGFloat {
            return layout.paddingLeft
        }
        static func PaddingTop() -> CGFloat {
            return layout.paddingTop
        }
        static func PaddingRight() -> CGFloat {
            return layout.paddingRight
        }
        static func PaddingBottom() -> CGFloat {
            return layout.paddingBottom
        }
        static func Width() -> CGFloat {
            return layout.width
        }
        static func Height() -> CGFloat {
            return layout.height
        }
    }
    
    // MARK: CardStyle
    struct CardStyle {
        
        // Read data from JSON
        
        static let style = StyleTemplate(shadowRadius: 2.0,
                                         shadowOpacity: 0.15,
                                         shadowOffsetY: 3.0,
                                         shadowColor: UIColor(hex: ApplicationTheme.Colors.CardShadowString()),
                                         cornerRadius: 4.0,
                                         borderWidth: 1.0,
                                         backgroundColor: UIColor(hex: ApplicationTheme.Colors.WhiteString()))
        
        static func ShadowRadius() -> CGFloat {
            return style.shadowRadius
        }
        static func ShadowOpacity() -> CGFloat {
            return style.shadowOpacity
        }
        static func ShadowOffsetY() -> CGFloat {
            return style.shadowOffsetY
        }
        static func ShadowColor() -> UIColor {
            return style.shadowColor
        }
        static func CornerRadius() -> CGFloat {
            return style.cornerRadius
        }
        static func BorderWidth() -> CGFloat {
            return style.borderWidth
        }
        static func BackgroundColor() -> UIColor {
            return style.backgroundColor
        }
    }
    
    // MARK: CardLayout
    struct CardLayout {
        
        // Read data from JSON here
        
        static let layout = LayoutTemplate(paddingLeft: 18,
                                    paddingTop: 9,
                                    paddingRight: 19,
                                    paddingBottom: 10,
                                    width: 0,
                                    height: 20)
        
        static func PaddingLeft() -> CGFloat {
            return layout.paddingLeft
        }
        static func PaddingTop() -> CGFloat {
            return layout.paddingTop
        }
        static func PaddingRight() -> CGFloat {
            return layout.paddingRight
        }
        static func PaddingBottom() -> CGFloat {
            return layout.paddingBottom
        }
        static func Width() -> CGFloat {
            return layout.width
        }
        static func Height() -> CGFloat {
            return layout.height
        }
    }
    
    
    
    // MARK: Account Name Layout
    struct AccountNameLayout {
        
        // Read data from JSON here
        
        static let layout = LayoutTemplate(paddingLeft: 15,
                                    paddingTop: 25,
                                    paddingRight: 15,
                                    paddingBottom: 0,
                                    width: 0,
                                    height: 20)
        
        static func PaddingLeft() -> CGFloat {
            return layout.paddingLeft
        }
        static func PaddingTop() -> CGFloat {
            return layout.paddingTop
        }
        static func PaddingRight() -> CGFloat {
            return layout.paddingRight
        }
        static func PaddingBottom() -> CGFloat {
            return layout.paddingBottom
        }
        static func Width() -> CGFloat {
            return layout.width
        }
        static func Height() -> CGFloat {
            return layout.height
        }
    }
    
    // MARK: Available Balane Layout
    struct AvailableBalanceLayout {
        
        // Read data from JSON here
        
        static let layout = LayoutTemplate(paddingLeft: 15,
                                    paddingTop: 7,
                                    paddingRight: 15,
                                    paddingBottom: 0,
                                    width: 0,
                                    height: 28)
        
        static func PaddingLeft() -> CGFloat {
            return layout.paddingLeft
        }
        static func PaddingTop() -> CGFloat {
            return layout.paddingTop
        }
        static func PaddingRight() -> CGFloat {
            return layout.paddingRight
        }
        static func PaddingBottom() -> CGFloat {
            return layout.paddingBottom
        }
        static func Width() -> CGFloat {
            return layout.width
        }
        static func Height() -> CGFloat {
            return layout.height
        }
    }
    
    // MARK: Account Number Layout
    struct AccountNumberLayout {
        
        // Read data from JSON here
        
        static let layout = LayoutTemplate(paddingLeft: 15,
                                    paddingTop: 20,
                                    paddingRight: 15,
                                    paddingBottom: 0,
                                    width: 0,
                                    height: 18)
        
        static func PaddingLeft() -> CGFloat {
            return layout.paddingLeft
        }
        static func PaddingTop() -> CGFloat {
            return layout.paddingLeft
        }
        static func PaddingRight() -> CGFloat {
            return layout.paddingRight
        }
        static func PaddingBottom() -> CGFloat {
            return layout.paddingBottom
        }
        static func Width() -> CGFloat {
            return layout.width
        }
        static func Height() -> CGFloat {
            return layout.height
        }
    }
    
    // MARK: Opened Date Layout
    struct OpenedDateLayout {
        
        // Read data from JSON here
        
        static let layout = LayoutTemplate(paddingLeft: 15,
                                    paddingTop: 25,
                                    paddingRight: 15,
                                    paddingBottom: 0,
                                    width: 0,
                                    height: 18)
        
        static func PaddingLeft() -> CGFloat {
            return CGFloat(layout.paddingLeft)
        }
        static func PaddingTop() -> CGFloat {
            return CGFloat(layout.paddingTop)
        }
        static func PaddingRight() -> CGFloat {
            return CGFloat(layout.paddingRight)
        }
        static func PaddingBottom() -> CGFloat {
            return CGFloat(layout.paddingBottom)
        }
        static func Width() -> CGFloat {
            return CGFloat(layout.width)
        }
        static func Height() -> CGFloat {
            return CGFloat(layout.height)
        }
    }
}
