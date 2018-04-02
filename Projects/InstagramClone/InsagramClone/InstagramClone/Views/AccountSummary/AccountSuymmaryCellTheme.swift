//
//  AccountSuymmaryCellTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct AccountSuymmaryCellTheme {
    
    // Mark: Text Values
    private static let accountNameFont = 13.0
    private static let availableBalanceFont = 22.0
    private static let accountNumberFont = 13.0
    
    struct AssetNames {
        
        // MARK: Add assets to be used here
        static func CompanyLogoSmall() -> String {
            return ApplicationTheme.AssetNames.CompanyLogoSmall()
        }
    }
    
    struct Colors {
        
        // MARK: Account Summary Colors
        
        static func CellBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor3String())
        }
        
        static func CardShadowColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.CardShadowString())
        }
        
        static func AccountNameColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor2String())
        }
        
        static func AccountNumberColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
        }
        
        static func CardColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.WhiteString())
        }
    }
    
    // MARK: Label Values
    struct LabelStyle {
        
        static func AccountNameFont() -> CGFloat {
            return CGFloat(accountNameFont)
        }
        
        static func AvailableBalanceFont() -> CGFloat {
            return CGFloat(availableBalanceFont)
        }
        
        static func AccountNumberFont() -> CGFloat {
            return CGFloat(accountNumberFont)
        }
    }
    
    // MARK: Card Shape Values
    struct CardStyle {
        static func CornerRadius() -> CGFloat {
            return CGFloat(4.0)
        }
        
        static func BorderWidth() -> CGFloat {
            return CGFloat(1.0)
        }
    }
}
