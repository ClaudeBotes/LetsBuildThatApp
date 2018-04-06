//
//  SignUpTheme.swift
//  InstagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct SignUpTheme {
    
    // Mark: Text Values
    private static let fontSize = 16.0
    
    struct AssetNames {
        
        // MARK: Screen Background Image
        
        static func BackgroundImage() -> String {
            return "signup-background"
        }
        
        static func CompanyLogo() -> String {
            return ApplicationTheme.AssetNames.CompanyLogoLarge()
        }
    }
    
    struct Colors {
        
        // MARK: SignUp Button Colors
        
        static func SignUpButtonBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor1String())
        }
        
        static func SignUpButtonBorderColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor1String())
        }
        
        static func SignUpButtonTextColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.WhiteString())
        }
        
        // MARK: TextField Colors
        
        static func TextFieldTextColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.WhiteString())
        }
        
        static func TextFieldPlaceholderTextColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.LightGrayString())
        }
        
        static func TextFieldBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor2String())
        }
    }
    
    // MARK: TextField Shape Values
    struct TextFieldStyle {
        
        static func CornerRadius() -> CGFloat {
            return CGFloat(4.0)
        }
        
        static func BorderWidth() -> CGFloat {
            return CGFloat(1.0)
        }
        
        static func TextFieldPadding() -> CGFloat {
            return CGFloat(15.0)
        }
        
        static func FontSize() -> CGFloat {
            return CGFloat(fontSize)
        }
    }
    
    // MARK: SignUp Button Shape Values
    struct SignUpButtonStyle {
        static func CornerRadius() -> CGFloat {
            return CGFloat(4.0)
        }
        
        static func BorderWidth() -> CGFloat {
            return CGFloat(1.0)
        }
    }
}
