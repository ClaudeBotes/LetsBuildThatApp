//
//  TransactionCellTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct TransactionCellTheme {
    
    // Mark: Text Values
    private static let transactionNameFont = 17.0
    private static let transactionAmountFont = 15.0
    private static let newPaymentButtonTextFont = 17.0
    private static let screenTitleTextFont = 34.0
    
    struct AssetNames {
        
        // MARK: Add assets to be used here
        static func CompanyLogoSmall() -> String {
            return ApplicationTheme.AssetNames.CompanyLogoSmall()
        }
    }
    
    struct Colors {
        
        // MARK: Contact Colors
        
        static func CellBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.WhiteString())
        }
        
        static func TransactionNameColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor2String())
        }
        
        static func TransactionAmountColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
        }
        
        static func AccountNumberColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
        }
        
        static func AccountNameColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
        }
        
        static func NewPaymentButtonBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor2String())
        }
        
        static func NewPaymentButtonTextColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.WhiteString())
        }
    
    }
    
    // MARK: Label Values
    struct TextFieldStyle {
        
        static func TransactionNameFont() -> CGFloat {
            return CGFloat(transactionNameFont)
        }
        
        static func TransactionAmountFont() -> CGFloat {
            return CGFloat(transactionAmountFont)
        }
        
        static func ScreenTitleFont() -> CGFloat {
            return CGFloat(screenTitleTextFont)
        }
    }
    
    // MARK: New Payment Button Shape Values
    struct NewPaymentButtonStyle {
        static func CornerRadius() -> CGFloat {
            return CGFloat(4.0)
        }
        
        static func BorderWidth() -> CGFloat {
            return CGFloat(1.0)
        }
        
        static func FontSize() -> CGFloat {
            return CGFloat(newPaymentButtonTextFont)
        }
    }
    
    
}
