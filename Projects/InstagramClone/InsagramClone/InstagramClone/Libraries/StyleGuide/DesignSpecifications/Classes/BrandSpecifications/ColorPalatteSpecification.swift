//
//  ColorPalatteSpecification.swift
//  InstagramClone
//
//  This file is for working with your color palette once its loaded from JSON.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

struct ColorPalatteSpecification {
    var primary: UIColor
    var secondary: UIColor
    var success: UIColor
    var danger: UIColor
    var warning: UIColor
    var info: UIColor
    var light: UIColor
    var dark: UIColor
    
    init(){
        self.primary = .clear
        self.secondary = .clear
        self.success = .clear
        self.danger = .clear
        self.warning = .clear
        self.info = .clear
        self.light = .clear
        self.dark = .clear
    }
    
    init(primary: UIColor = UIColor.clear,
         secondary: UIColor = UIColor.clear,
         success: UIColor = UIColor.clear,
         danger: UIColor = UIColor.clear,
         warning: UIColor = UIColor.clear,
         info: UIColor = UIColor.clear,
         light: UIColor = UIColor.clear,
         dark: UIColor = UIColor.clear )
    {
        self.primary = primary
        self.secondary = secondary
        self.success = success
        self.danger = danger
        self.warning = warning
        self.info = info
        self.light = light
        self.dark = dark
    }
}
