//
//  StyleHelpers.swift
//  InstagramClone
//
//  This file is for any helper methods or types related to styling.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

public enum StylingError: Error {
    case invalidFontSize
    case invalidColor
    case invalidLayoutValue
}

public func HandleStylingError(errorType: StylingError){}

/**
 Use this method if to get the design spec for a given screen.
 
 @param screenName Screen which needs to be located in the Design Specification.
 @return DesignSpecForScreen Design specification / properties that will be returned for the given screen name.
 */
public func getDesignSpecForScreen(screenName: String) -> DesignSpecificationForScreen {
    
    let designSpec = JSONReader.shared.getDesignSpecificationForComponents()
    var designSpecForScreen = DesignSpecificationForScreen()
    
    for screenSpecification in designSpec.screenSpecifications {
        
        if screenSpecification.screenName == screenName {
            designSpecForScreen = screenSpecification
        }
    }
    return designSpecForScreen
}

/**
 Use this method if you choose to store a style for a given label in its own file.
 
 @param textStyle The TextStyleObject that should be updated.
 @param labelName Will be used to identify the json file in which text style properties can be found.
 @param textColor Color which label should be set to.
 */
public func setLabelStyle( textStyle: inout DesignSpecificationForTextStyle, labelName label: String, textColor: UIColor) {
    
    let jsonData = JSONReader.shared.getTextStyleJSONDataFor(labelName: label)  as? [TextStyleForJSON]
    
    // If any results exist
    if let textStyles = jsonData {
        
        // For each style item returned
        for style in textStyles {
            
            // If fontSize are available, set fontSize
            if let fontSizeString = style.fontSize {
                do {
                    let fontSize = try convertFontSizeCssStringToCGFloat(value: fontSizeString)
                    textStyle.fontSize = fontSize
                }
                catch{
                    print(error)
                }
            }
            
            // Set Text Alignment
            if let textAlignment = style.textAlighnment{
                textStyle.textAlighnment = setTextAlignment(textAlignment: textAlignment)
            }
            
            // Set text color
            textStyle.textColor = textColor
        }
    }
}


