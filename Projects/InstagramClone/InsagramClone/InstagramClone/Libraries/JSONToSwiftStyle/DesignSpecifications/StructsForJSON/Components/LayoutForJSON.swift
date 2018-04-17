//
//  LayoutForJSON.swift
//  InstagramClone
//
//  Used to map JSON layout to a struct when reading from JSON.
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
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
