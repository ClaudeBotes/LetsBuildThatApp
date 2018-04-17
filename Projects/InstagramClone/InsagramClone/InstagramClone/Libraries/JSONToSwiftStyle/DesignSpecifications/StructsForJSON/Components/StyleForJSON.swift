//
//  StyleForJSON.swift
//  InstagramClone
//
//  Used for mapping Style from JSON to struct when reading from JSON.
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
/**
 Node containing the style for a component. ( "fontSize": "13px", )
 */
struct StyleForJSON: Codable {
    var text: String?
    var fontSize: String?
    var textAlighnment: String?
    var shadowRadius : String?
    var shadowOpacity : String?
    var shadowOffsetY : String?
    var shadowColor : String?
    var cornerRadius: String?
    var borderWidth: String?
    var backgroundColor: String?
    var assetName: String?
    var leftPaddingForText: String?
    var rightPaddingForText: String?
    var lineHeight: String?
    
    enum CodingKeys: String, CodingKey {
        case text
        case fontSize
        case textAlighnment = "textAlign"
        case shadowRadius
        case shadowOpacity
        case shadowOffsetY
        case shadowColor
        case cornerRadius
        case borderWidth
        case backgroundColor
        case assetName
        case leftPaddingForText
        case rightPaddingForText
        case lineHeight
    }
}
