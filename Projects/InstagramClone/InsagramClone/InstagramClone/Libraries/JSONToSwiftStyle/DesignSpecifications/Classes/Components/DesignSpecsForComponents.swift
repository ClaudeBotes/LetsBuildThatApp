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



