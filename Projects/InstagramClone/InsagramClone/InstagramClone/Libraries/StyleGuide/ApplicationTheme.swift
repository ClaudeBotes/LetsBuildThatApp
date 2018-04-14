//
//  ApplicationTheme.swift
//  InstagramClone
//
//  Created by Claude on 30/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct ApplicationTheme {
    
    
    
    // TODO
    // 1. All values to come from JSON
    // 2. Colors and fonts for component themes should be centralised
    
    // MARK: BASE THEME VALUES
    
    // MARK: COLORS
    private static let primaryColor1 = "F80060" // pink
    private static let primaryColor2 = "1281AC" // blue
    private static let primaryColor3 = "FBFBFB" // offwhite
    
    
    // Other Colors:
    
    private static let white = "FFFFFF" // white
    private static let lightGray = "A8A8B8" // light gray
    private static let cardShadowColor = "000000" //black
    private static let rowSeperatorColor = "D8D8D8" // another light gray

    // MARK: Asset Names
    
    private static let companyLogoLarge = "bank-logo"
    private static let companyLogoSmall = "bank-logo-small"
    
    struct AssetNames {
        
        static func CompanyLogoLarge() -> String {
            return companyLogoLarge
        }
        
        static func CompanyLogoSmall() -> String {
            return companyLogoLarge
        }
        
        
    }
    
    // MARK: COLOR GET METHODS
    struct Colors {
        
        // Primary Color 1
        static func PrimaryColor1() -> UIColor {
            return UIColor(hex: primaryColor1)
        }
        
        static func PrimaryColor1String() -> String {
            return primaryColor1
        }
        
        // Primary Color 2
        
        static func PrimaryColor2() -> UIColor {
            return UIColor(hex: primaryColor2)
        }
        
        static func PrimaryColor2String() -> String {
            return primaryColor2
        }
        
        // Primary Color 3
        
        static func PrimaryColor3() -> UIColor {
            return UIColor(hex: primaryColor3)
        }
        
        static func PrimaryColor3String() -> String {
            return primaryColor3
        }
        
        // White
        static func White() -> UIColor {
            return UIColor(hex: white)
        }
        
        static func WhiteString() -> String {
            return white
        }
        
        // Light Gray
        static func LightGray() -> UIColor {
            return UIColor(hex: lightGray)
        }
        
        static func LightGrayString() -> String {
            return lightGray
        }
        
        // Card Shadow
        static func CardShadow() -> UIColor {
            return UIColor(hex: cardShadowColor)
        }
        
        static func CardShadowString() -> String {
            return cardShadowColor
        }
        
        // Light Gray for row seperators
        static func RowSeperatorColor() -> UIColor {
            return UIColor(hex: rowSeperatorColor)
        }
        
        static func RowSeperatorColorString() -> String {
            return rowSeperatorColor
        }
    }
    
    // MARK: FONTS
    struct Fonts {
        
        enum fontExperiment: String {
            case custom = "custom"
            case system = "system"
        }
        
        static private func preferedFont() -> fontExperiment {
            return .system
        }
        
        static func LargeTitle() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .largeTitle)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.largeTitle)
            }
        }
        
        static func Title1() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .title1)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
            }
        }
        
        static func Title2() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .title2)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
            }
        }
        
        static func Title3() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .title3)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.title3)
            }
        }
        
        static func Headline() -> UIFont {
            
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .headline)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            }
        }
        
        static func Body() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .body)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
            }
        }
        
        static func Callout() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .callout)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.callout)
            }
        }
        
        static func Subheadline() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .subheadline)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
            }
        }
        
        static func Footnote() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .footnote)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
            }
        }
        
        static func Caption1() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .caption1)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
            }
        }
        
        static func Caption2() -> UIFont {
            if preferedFont() == .custom {
                return FontBook.Regular.of(style: .caption2)
            } else {
                return UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption2)
            }
        }
    }

}

