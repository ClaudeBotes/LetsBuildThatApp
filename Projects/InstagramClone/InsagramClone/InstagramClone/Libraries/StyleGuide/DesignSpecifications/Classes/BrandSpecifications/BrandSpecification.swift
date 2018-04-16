//
//  BrandSpecification.swift
//  InstagramClone
//
//  This file is for working with your brand once its loaded from JSON.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

final class BrandSpecification {
    
    static let shared = BrandSpecification()
    var colorPalette = ColorPalatteSpecification()
    
    private init() {
        getBrandColorsFromJSON()
    }

    private func getBrandColorsFromJSON(){
        let jsonData = JSONReader.shared.getBrandingJSONData()  as? [BrandSpecStructForJSON]
        
        // If any results exist
        if let brand = jsonData {
            
            // For each brand item returned
            for brandItem in brand {
                
                // If colors are available, set color palette
                if let colors = brandItem.colors {
                    setColorPalette(colors: colors)
                }
            }
        }
    }
    
    private func setColorPalette(colors: ColorStructForJSON) {
        
        if let primary = colors.primary {
            self.colorPalette.primary = UIColor(hex: primary)
        }
        if let secondary = colors.secondary {
            self.colorPalette.secondary = UIColor(hex: secondary)
        }
        if let success = colors.success {
            self.colorPalette.success = UIColor(hex: success)
        }
        if let danger = colors.danger {
            self.colorPalette.danger = UIColor(hex: danger)
        }
        if let warning = colors.warning {
            self.colorPalette.warning = UIColor(hex: warning)
        }
        if let info = colors.info {
            self.colorPalette.info = UIColor(hex: info)
        }
        if let light = colors.light {
            self.colorPalette.light = UIColor(hex: light)
        }
        if let dark = colors.dark {
            self.colorPalette.dark = UIColor(hex: dark)
        }
        if let white = colors.white {
            self.colorPalette.white = UIColor(hex: white)
        }
    }
}


