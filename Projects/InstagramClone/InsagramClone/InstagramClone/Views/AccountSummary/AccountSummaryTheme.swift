//
//  AccountSummaryTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit
struct AccountSuymmaryTheme {
    
    // Mark: Text Values
    
    struct AssetNames {
        // MARK: Add assets to be used here
    }
    
    struct Colors {
        
        // MARK: Account Summary Screen / View
        static func ViewBackgroundColor() -> UIColor {
            return UIColor(hex: ApplicationTheme.Colors.PrimaryColor3String())
        }
    }
}
