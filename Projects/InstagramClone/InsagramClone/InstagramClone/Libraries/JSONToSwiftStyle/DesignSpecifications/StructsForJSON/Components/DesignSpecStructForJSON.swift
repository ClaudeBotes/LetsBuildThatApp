//
//  DesignSpecStructForJSON.swift
//  InstagramClone
//
//  This file is used specifically to map structs to the DesignSpecification when reading from JSON file.
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







