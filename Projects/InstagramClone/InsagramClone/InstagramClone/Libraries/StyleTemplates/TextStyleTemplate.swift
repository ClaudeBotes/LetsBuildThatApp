//
//  TextStyleTemplate.swift
//  InstagramClone
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct TextStyleFromJSON: Codable {
    var fontSize: CGFloat?
    var textColor: String?
    var textAlighnment: String?
    
    enum CodingKeys: String, CodingKey {
        case fontSize, textColor, textAlighnment
    }
}

struct TextStyleTemplate {
    var fontSize : CGFloat
    var textColor : UIColor
    var textAlighnment : NSTextAlignment
    
    init(){
        self.fontSize = 12.0
        self.textColor = UIColor.black
        self.textAlighnment = NSTextAlignment.center
    }
    
    init(fontSize: CGFloat = 12.0, textColor: UIColor = UIColor.black, textAlignment: NSTextAlignment = NSTextAlignment.center){
        self.fontSize = fontSize
        self.textColor = textColor
        self.textAlighnment = textAlignment
    }
}
