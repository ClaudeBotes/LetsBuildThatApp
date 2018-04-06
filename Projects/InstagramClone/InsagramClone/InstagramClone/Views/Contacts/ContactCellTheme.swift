//
//  ContactCellTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct ContactCellTheme {
    
    // Mark: Text Values
    private static let contactNameFont = 17.0
    private static let accountNumberFont = 15.0
    private static let newContactButtonTextFont = 16.0
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
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor3String())
        }
        
        static func ContactNameColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor2String())
        }
        
        static func AccountNumberColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
        }
        
        static func NewContactButtonBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor1String())
        }
        
        static func NewContactButtonTextColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.WhiteString())
        }
    
    }
    
    // MARK: Label Values
    struct TextFieldStyle {
        
        static func ContactNameFont() -> CGFloat {
            return CGFloat(contactNameFont)
        }
        
        static func AccountNumberFont() -> CGFloat {
            return CGFloat(accountNumberFont)
        }
        
        static func ScreenTitleFont() -> CGFloat {
            return CGFloat(screenTitleTextFont)
        }
    }
    
    // MARK: New Contact Button Shape Values
    struct NewContactButtonStyle {
        static func CornerRadius() -> CGFloat {
            return CGFloat(4.0)
        }
        
        static func BorderWidth() -> CGFloat {
            return CGFloat(1.0)
        }
        
        static func FontSize() -> CGFloat {
            return CGFloat(newContactButtonTextFont)
        }
    }
    
    
}
