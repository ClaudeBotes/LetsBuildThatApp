//
//  TransactionTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit
struct TransactionTheme {
    
    // Mark: Text Values
    
    struct AssetNames {
        // MARK: Add assets to be used here
    }
    
    struct Colors {
        
        // MARK: Transaction Screen / View
        static func ViewBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor3String())
        }
        
        static func RowSeperatorColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.RowSeperatorColorString())
        }
        
        
    }
}
