//
//  StyleSheet.swift
//  InstagramClone
//
//  Created by Claude Botes on 16/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

public class StyleSheet {
    
    var style: DesignSpecificationForStyle
    let componentName: String
    let screenName: String
    
    init(screenName: String, componentName: String){
        let designSpec = getDesignSpecForComponentStyle(screenName: screenName, componentName: componentName)
        self.style = designSpec
        self.componentName = componentName
        self.screenName = screenName
    }
    
    var title: String {
        get {
            return self.style.text
        }
        set {
            self.style.text = newValue
        }
    }
    
    var fontSize: CGFloat {
        get {
            return self.style.fontSize
        }
        set {
            self.style.fontSize = newValue
        }
    }
    
    
    var textColor: UIColor {
        get {
            return self.style.textColor
        }
        set {
            self.style.textColor = newValue
        }
    }
    
    var textAlignment: NSTextAlignment {
        get {
            return self.style.textAlighnment
        }
        set {
            self.style.textAlighnment = newValue
        }
    }
    
    var shadowRadius: CGFloat {
        get {
            return self.style.shadowRadius
        }
        set {
            self.style.shadowRadius = newValue
        }
    }
    
    var shadowOpacity: CGFloat {
        get {
            return self.style.shadowOpacity
        }
        set {
            self.style.shadowOpacity = newValue
        }
    }
    
    var shadowOffsetY: CGFloat {
        get {
            return self.style.shadowOffsetY
        }
        set {
            self.style.shadowOffsetY = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return self.style.cornerRadius
        }
        set {
            self.style.cornerRadius = newValue
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return self.style.borderWidth
        }
        set {
            self.style.borderWidth = newValue
        }
    }
    
    var shadowColor: UIColor {
        get {
            return self.style.shadowColor
        }
        set {
            self.style.shadowColor = newValue
        }
    }

    var backgroundColor: UIColor {
        get {
            return self.style.backgroundColor
        }
        set {
            self.style.backgroundColor = newValue
        }
    }
    
    var borderColor: UIColor {
        get {
            return self.style.borderColor
        }
        set {
            self.style.borderColor = newValue
        }
    }
    
    var assetName: String {
        get {
            return self.style.assetName
        }
        set {
            self.style.assetName = newValue
        }
    }
    
    var leftPaddingForText: CGFloat {
        get {
            return self.style.leftPaddingForText
        }
        set {
            self.style.leftPaddingForText = newValue
        }
    }
    
    var rightPaddingForText: CGFloat {
        get {
            return self.style.rightPaddingForText
        }
        set {
            self.style.rightPaddingForText = newValue
        }
    }
    
    var lineHeight: CGFloat {
        get {
            return self.style.lineHeight
        }
        set {
            self.style.lineHeight = newValue
        }
    }
    
    var placeholderTextColor: UIColor {
        get {
            return self.style.placeholderTextColor
        }
        set {
            self.style.placeholderTextColor = newValue
        }
    }
    
    
}
