//
//  DesignSpecificationForStyle.swift
//  InstagramClone
//
//  This file is used to map an object to the JSON spec for Style.
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit
/**
 Used to group design specifications for a specific component style.
 */
public struct DesignSpecificationForStyle {
    var text: String
    var fontSize: CGFloat
    var textColor: UIColor
    var textAlighnment: NSTextAlignment
    var shadowRadius: CGFloat
    var shadowOpacity: CGFloat
    var shadowOffsetY: CGFloat
    var shadowColor: UIColor
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var borderColor: UIColor
    var backgroundColor: UIColor
    var assetName: String
    var leftPaddingForText: CGFloat
    var rightPaddingForText: CGFloat
    var lineHeight: CGFloat
    var placeholderTextColor: UIColor
    
    init(){
        self.text = ""
        self.fontSize = 12.0
        self.textAlighnment = NSTextAlignment.center
        self.textColor = .black
        self.shadowRadius = 0
        self.shadowOpacity = 0
        self.shadowOffsetY = 0
        self.shadowColor = .black
        self.cornerRadius = 0
        self.borderWidth = 0
        self.borderColor = .black
        self.backgroundColor = .white
        self.assetName = ""
        self.leftPaddingForText = 0
        self.rightPaddingForText = 0
        self.lineHeight = 1.5
        self.placeholderTextColor = .black
    }
    
    init(text: String = "",
         fontSize: CGFloat = 12.0,
         textAlignment: NSTextAlignment = NSTextAlignment.center,
         textColor: UIColor = .black,
         shadowRadius: CGFloat = 0,
         shadowOpacity: CGFloat = 0,
         shadowOffsetY: CGFloat = 0,
         shadowColor: UIColor = .black,
         cornerRadius: CGFloat = 0,
         borderWidth: CGFloat = 0,
         borderColor:UIColor = .black,
         backgroundColor: UIColor = .white,
         assetName: String = "",
         leftPaddingForText: CGFloat = 0,
         rightPaddingForText: CGFloat = 0,
         lineHeight: CGFloat = 1.5,
         placeholderTextColor: UIColor = .black){
        
        self.text = text
        self.fontSize = fontSize
        self.textAlighnment = textAlignment
        self.textColor = textColor
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.shadowOffsetY = shadowOffsetY
        self.shadowColor = shadowColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.assetName = assetName
        self.leftPaddingForText = leftPaddingForText
        self.rightPaddingForText = rightPaddingForText
        self.lineHeight = lineHeight
        self.placeholderTextColor = placeholderTextColor
    }
}
