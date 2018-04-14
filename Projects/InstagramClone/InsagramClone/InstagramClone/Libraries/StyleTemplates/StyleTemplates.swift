//
//  AccountSuymmaryCellTheme.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit



struct StyleTemplate {
    let shadowRadius : CGFloat
    let shadowOpacity : CGFloat
    let shadowOffsetY : CGFloat
    let shadowColor : UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let backgroundColor: UIColor
    
    init(){
        self.shadowRadius = 0
        self.shadowOpacity = 0
        self.shadowOffsetY = 0
        self.shadowColor = UIColor.clear
        self.cornerRadius = 0
        self.borderWidth = 0
        self.backgroundColor = UIColor.clear
    }
    
    init(shadowRadius: CGFloat, shadowOpacity : CGFloat, shadowOffsetY: CGFloat, shadowColor: UIColor, cornerRadius: CGFloat, borderWidth: CGFloat, backgroundColor: UIColor){
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.shadowOffsetY = shadowOffsetY
        self.shadowColor = shadowColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.backgroundColor = backgroundColor
    }
}

struct LayoutTemplate {
    let paddingLeft : CGFloat
    let paddingTop : CGFloat
    let paddingRight : CGFloat
    let paddingBottom : CGFloat
    let width: CGFloat
    let height: CGFloat
    
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


