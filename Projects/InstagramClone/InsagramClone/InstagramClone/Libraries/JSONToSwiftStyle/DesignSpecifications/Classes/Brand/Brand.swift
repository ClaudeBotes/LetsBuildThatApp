//
//  Brand.swift
//  InstagramClone
//
//  This file is for working with your brand once its loaded from JSON.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

final class Brand {
    
    static let shared = Brand()
    var colorPalette = DesignSpecificationForColorPalatte()
    
    private init() {
        getBrandColorsFromJSON()
    }

    private func getBrandColorsFromJSON(){
        colorPalette = JSONReader.shared.getDesignSpecificationForBrand().colorPalatteSpecification
    }
}


