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

public enum DefaultComponentValues: String {
    case ScreenName = "ScreenNameNotSet"
    case LabelName = "LabelNotSet"
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
 Used to group all / multiple design specifications for a label on a screen / artboard.
 */
public struct DesignSpecificationForScreen {
    var screenName: String
    var labels: [DesignSpecificationForLabel]
    
    init(){
        self.screenName = DefaultComponentValues.ScreenName.rawValue
        self.labels = [DesignSpecificationForLabel]()
    }
    
    init(screenName: String = DefaultComponentValues.ScreenName.rawValue, labels: [DesignSpecificationForLabel] = [DesignSpecificationForLabel]()){
        self.screenName = screenName
        self.labels = labels
    }
}

/**
 Used to group design specifications for a specific label.
 */
public struct DesignSpecificationForLabel {
    var name: String
    var style: DesignSpecificationForTextStyle
    var layout: DesignSpecificationForLayout
    
    init(){
        self.name = DefaultComponentValues.LabelName.rawValue
        self.style = DesignSpecificationForTextStyle()
        self.layout = DesignSpecificationForLayout()
    }
    
    init(name: String =  DefaultComponentValues.LabelName.rawValue, style: DesignSpecificationForTextStyle = DesignSpecificationForTextStyle(), layout: DesignSpecificationForLayout = DesignSpecificationForLayout()){
        self.name = name
        self.style = style
        self.layout = layout
    }
    
}

/**
 Used to group design specifications for a specific label style.
 */
public struct DesignSpecificationForTextStyle {
    var fontSize: CGFloat
    var textColor: UIColor
    var textAlighnment: NSTextAlignment
    
    init(){
        self.fontSize = 12.0
        self.textAlighnment = NSTextAlignment.center
        self.textColor = .clear
    }
    
    init(fontSize: CGFloat = 12.0, textAlignment: NSTextAlignment = NSTextAlignment.center, textColor: UIColor = .clear){
        self.fontSize = fontSize
        self.textAlighnment = textAlignment
        self.textColor = textColor
    }
}

/**
 Used to group design specifications for a specific label layout.
 */
public struct DesignSpecificationForLayout {
    var fontSize: CGFloat
    var textColor: UIColor
    var textAlighnment: NSTextAlignment
    
    init(){
        self.fontSize = 12.0
        self.textAlighnment = NSTextAlignment.center
        self.textColor = .clear
    }
    
    init(fontSize: CGFloat = 12.0, textAlignment: NSTextAlignment = NSTextAlignment.center, textColor: UIColor = .clear){
        self.fontSize = fontSize
        self.textAlighnment = textAlignment
        self.textColor = textColor
    }
}









