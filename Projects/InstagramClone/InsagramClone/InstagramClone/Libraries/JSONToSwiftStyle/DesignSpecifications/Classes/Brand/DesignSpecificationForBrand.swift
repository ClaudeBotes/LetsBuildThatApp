//
//  DesignSpecificationForBrand.swift
//  InstagramClone
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

/**
 Used to group all / multiple design specifications for a your brand.
 */
public struct DesignSpecificationForBrand {
    var colorPalatteSpecification: DesignSpecificationForColorPalatte
    
    init(){
        self.colorPalatteSpecification = DesignSpecificationForColorPalatte()
    }
}
