//
//  BrandSpecStructForJSON.swift
//  InstagramClone
//
//  This file is used specifically to map structs to the Brand JSON file.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

/**
 Main node of the brand specification. ( "colors": { )
 */
struct BrandSpecificationForJSON: Codable {
    var colors: ColorStructForJSON?
    
    enum CodingKeys: String, CodingKey {
        case colors
    }
}

/**
 Node containing your brand colors. ( "primary": "1281AC", )
 */
struct ColorStructForJSON: Codable {
    var primary: String?
    var secondary: String?
    var success: String?
    var danger: String?
    var warning: String?
    var info: String?
    var light: String?
    var dark: String?
    var white: String?
    var signUpTextFieldDark: String?
    
    enum CodingKeys: String, CodingKey {
        case primary, secondary, success, danger, warning, info, light, dark, white, signUpTextFieldDark
    }
}


