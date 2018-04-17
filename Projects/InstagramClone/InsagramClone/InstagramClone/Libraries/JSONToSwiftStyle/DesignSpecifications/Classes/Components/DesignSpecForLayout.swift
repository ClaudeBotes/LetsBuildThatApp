//
//  DesignSpecificationForLayout.swift
//  InstagramClone
//
//  This file is used to map an object to the JSON spec for Layout.
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

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
