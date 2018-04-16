//
//  DesignSpecStructForJSON.swift
//  InstagramClone
//
//  This file is used specifically to map structs to the DesignSpecification JSON file.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

/**
 Main node of the design specification. ( "views" )
 */
struct DesignSpecificationForJSON: Codable {
    var views: [ViewForJSON]?
    
    enum CodingKeys: String, CodingKey {
        case views
    }
}

/**
 Node containing UI elements that can be found on a screen. (  "name": "accountSummary" )
 */
struct ViewForJSON: Codable {
    var name: String?
    var components: [ComponentForJSON]? // ( "labels": [ )
    
    enum CodingKeys: String, CodingKey {
        case name, components
    }
}

/**
 Node containing the style and layout for a component. ( "name": "availableBalance" )
 */
struct ComponentForJSON: Codable{
    var name: String?
    var style: StyleForJSON? // ( "style": { )
    var layout: LayoutForJSON? // ( "layout": { )
    
    enum CodingKeys: String, CodingKey{
        case name,style, layout
    }
}

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
    }
}

/**
 Node containing the layout for a label. ( "paddingLeft": "15" )
 */
struct LayoutForJSON: Codable {
    var paddingLeft: String?
    var paddingTop: String?
    var paddingRight: String?
    var paddingBottom: String?
    var width: String?
    var height: String?
    
    enum CodingKeys: String, CodingKey {
        case paddingLeft, paddingTop, paddingRight, paddingBottom, width, height
    }
}




