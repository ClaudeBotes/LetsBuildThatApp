//
//  Branding.swift
//  InstagramClone
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct BrandColorsFromJSON: Codable {
    var primary: String?
    var secondary: String?
    var success: String?
    var danger: String?
    var warning: String?
    var info: String?
    var light: String?
    var dark: String?
    
    enum CodingKeys: String, CodingKey {
        case primary, secondary, success, danger, warning, info, light, dark
    }
}
