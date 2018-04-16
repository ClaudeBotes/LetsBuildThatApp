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
    
    /**
     Always override colors if you plan to use any to ensire they are from Brand Specification
     - TextColor()
     - ShadowColor()
     - BorderColor()
     - BackgroundColor()
     */
    
    var style: DesignSpecificationForStyle
    let componentName: String
    let screenName: String
    
    init(screenName: String, componentName: String){
        let designSpec = getDesignSpecForComponentStyle(screenName: screenName, componentName: componentName)
        self.style = designSpec
        self.componentName = componentName
        self.screenName = screenName
    }
    
    func Title() -> String {
        return self.style.text
    }
    func Font() -> CGFloat {
        return self.style.fontSize
    }
    func TextColor() -> UIColor {
        return self.style.textColor
    }
    func TextAlignment() -> NSTextAlignment {
        return self.style.textAlighnment
    }
    func ShadowRadius() -> CGFloat {
        return self.style.shadowRadius
    }
    func ShadowOpacity() -> CGFloat {
        return self.style.shadowOpacity
    }
    func ShadowOffsetY() -> CGFloat {
        return self.style.shadowOffsetY
    }
    func CornerRadius() -> CGFloat {
        return self.style.cornerRadius
    }
    func BorderWidth() -> CGFloat {
        return self.style.borderWidth
    }
    func ShadowColor() -> UIColor {
        return self.style.shadowColor
    }
    func BackgroundColor() -> UIColor {
        return self.style.backgroundColor
    }
    func BorderColor() -> UIColor {
        return self.style.borderColor
    }
}
