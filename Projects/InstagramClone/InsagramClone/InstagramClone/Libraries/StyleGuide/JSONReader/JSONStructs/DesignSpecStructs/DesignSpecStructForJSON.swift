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
    var labels: [LabelForJSON]? // ( "labels": [ )
    
    enum CodingKeys: String, CodingKey {
        case name, labels
    }
}

/**
 Node containing the style and layout for a label. ( "name": "availableBalance" )
 */
struct LabelForJSON: Codable{
    var name: String?
    var style: TextStyleForJSON? // ( "style": { )
    var layout: TextLayoutForJSON? // ( "layout": { )
    
    enum CodingKeys: String, CodingKey{
        case name,style, layout
    }
}

/**
Node containing the style for a label. ( "fontSize": "13px", )
*/
struct TextStyleForJSON: Codable {
    var fontSize: String?
    var textAlighnment: String?
    
    enum CodingKeys: String, CodingKey {
        case fontSize
        case textAlighnment = "textAlign"
    }
}

/**
 Node containing the layout for a label. ( "fontSize": "13px", )
 */
struct TextLayoutForJSON: Codable {
    var fontSize: String?
    var textAlighnment: String?
    
    enum CodingKeys: String, CodingKey {
        case fontSize
        case textAlighnment = "textAlign"
    }
}
