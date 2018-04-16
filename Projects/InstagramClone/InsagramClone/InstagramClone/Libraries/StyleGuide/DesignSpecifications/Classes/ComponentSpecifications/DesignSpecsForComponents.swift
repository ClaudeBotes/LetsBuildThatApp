//
//  DesignSpecsForComponents.swift
//  InstagramClone
//
//  This file contains all the design specification structs for components a user would interact with.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

public enum DesignSpecNotSet: String {
    case ScreenName = "ScreenNameNotSet"
    case ComponentName = "ComponentNotSet"
}

/**
 Used to group all / multiple design specifications for a screen or artboard.
 */
public struct DesignSpecificationForComponents {
    var screenSpecifications: [DesignSpecificationForScreen]
    
    init(){
        self.screenSpecifications = [DesignSpecificationForScreen]()
    }
}

/**
 Used to group all / multiple design specifications for a component on a screen / artboard.
 */
public struct DesignSpecificationForScreen {
    var screenName: String
    var components: [DesignSpecificationForComponent]
    
    init(){
        self.screenName = DesignSpecNotSet.ScreenName.rawValue
        self.components = [DesignSpecificationForComponent]()
    }
    
    init(screenName: String = DesignSpecNotSet.ScreenName.rawValue, components: [DesignSpecificationForComponent] = [DesignSpecificationForComponent]()){
        self.screenName = screenName
        self.components = components
    }
}

/**
 Used to group design specifications for a specific component.
 */
public struct DesignSpecificationForComponent {
    var name: String
    var style: DesignSpecificationForStyle
    var layout: DesignSpecificationForLayout
    
    init(){
        self.name = DesignSpecNotSet.ComponentName.rawValue
        self.style = DesignSpecificationForStyle()
        self.layout = DesignSpecificationForLayout()
    }
    
    init(name: String =  DesignSpecNotSet.ComponentName.rawValue, style: DesignSpecificationForStyle = DesignSpecificationForStyle(), layout: DesignSpecificationForLayout = DesignSpecificationForLayout()){
        self.name = name
        self.style = style
        self.layout = layout
    }
}

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
         backgroundColor : UIColor = .white ){
        
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
    }
}

/**
 Used to group design specifications for a specific component layout.
 */
public struct DesignSpecificationForLayout {
    var paddingLeft: CGFloat
    var paddingTop: CGFloat
    var paddingRight: CGFloat
    var paddingBottom: CGFloat
    var width: CGFloat
    var height: CGFloat
    
    init(){
        self.paddingLeft = 0
        self.paddingTop = 0
        self.paddingRight = 0
        self.paddingBottom = 0
        self.width = 0
        self.height = 0
    }
    
    init(paddingLeft: CGFloat, paddingTop : CGFloat, paddingRight: CGFloat, paddingBottom: CGFloat, width: CGFloat, height: CGFloat){
        self.paddingLeft = paddingLeft
        self.paddingTop = paddingTop
        self.paddingRight = paddingRight
        self.paddingBottom = paddingBottom
        self.width = width
        self.height = height
    }
}


public class BaseStyleSheet {
    
    /**
     Always override colors if you plan to use any to ensire they are from Brand Specification
     - TextColor()
     - ShadowColor()
     - BorderColor()
     - BackgroundColor()
     */
    
    var style: DesignSpecificationForStyle
    var layout: DesignSpecificationForLayout
    let componentName: String
    let screenName: String
    
    init(screenName: String, componentName: String){
        let designSpec = getDesignSpecForComponent(screenName: screenName, componentName: componentName)
        self.style = designSpec.style
        self.layout = designSpec.layout
        self.componentName = componentName
        self.screenName = screenName
    }
    
    func SreenTitle() -> String {
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
    
    // MARK: Layout Methods
    
    func PaddingLeft() -> CGFloat {
        return self.layout.paddingLeft
    }
    func PaddingTop() -> CGFloat {
        return self.layout.paddingTop
    }
    func PaddingRight() -> CGFloat {
        return self.layout.paddingRight
    }
    func PaddingBottom() -> CGFloat {
        return self.layout.paddingBottom
    }
    func Width() -> CGFloat {
        return self.layout.width
    }
    func Height() -> CGFloat {
        return self.layout.height
    }
}


