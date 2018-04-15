//
//  AccountSummaryTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit





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
