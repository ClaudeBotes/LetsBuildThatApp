//
//  ContactTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit
struct ContactTheme {
    
    // Mark: Text Values
    
    struct AssetNames {
        // MARK: Add assets to be used here
    }
    
    struct Colors {
        
        // MARK: Contacts Screen / View
        static func ViewBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor3String())
        }
        
        static func RowSeperatorColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.RowSeperatorColorString())
        }
    }
}
