//
//  ApplicationTheme.swift
//  InsagramClone
//
//  Created by Claude on 30/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct ApplicationTheme {
    
    // MARK: BASE THEME VALUES
    
    // MARK: COLORS
    private static let primaryColor1 = "F80060" // pink
    private static let primaryColor1Dark = "36883A"
    private static let primaryColor2 = "2B2B50" // blue
    private static let lightGray = "A8A8B8"
    
    
    private static let amountInputBorderColor = "F3F3F3"
    private static let screenBackgroundColor = "E4EBF0"
    
    // MARK: TEXT COLORS
    private static let textInputColor = "919499"
    private static let placeholderTextColor = "B9B9B9"
    private static let labelColor = "565656"
    
    // used by labels above cards
    private static let cardLabelColor = "404040"
    private static let primaryButtonTitleColor = "FFFFFF"
    
    // MARK: COLOR GET METHODS
    struct Colors {
        
        static func PrimaryColor1() -> UIColor {
            return UIColor(hex: primaryColor1)
        }
        
        static func PrimaryColor1Dark() -> UIColor {
            return UIColor(hex: primaryColor1Dark)
        }
        
        static func PrimaryColor2() -> UIColor {
            return UIColor(hex: primaryColor2)
        }
        
        static func LightGray() -> UIColor {
            return UIColor(hex: lightGray)
        }
        
        static func PrimaryColorString() -> String {
            return primaryColor1
        }
        
        static func AmountInputBorderColor() -> UIColor {
            return UIColor(hex: amountInputBorderColor)
        }
        
        static func ScreenBackgroundColor() -> UIColor {
            return UIColor(hex: screenBackgroundColor)
        }
        
        static func TextInputColor() -> UIColor {
            return UIColor(hex: textInputColor)
        }
        
        static func PlaceholderTextColor() -> UIColor {
            return UIColor(hex: placeholderTextColor)
        }
        
        static func LabelColor() -> UIColor {
            return UIColor(hex: labelColor)
        }
        
        static func CardLabelColor() -> UIColor {
            return UIColor(hex: cardLabelColor)
        }
        
        static func CardLabelColorString() -> String {
            return cardLabelColor
        }
        
        static func PrimaryButtonTitleColor() -> UIColor {
            return UIColor(hex: primaryButtonTitleColor)
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

