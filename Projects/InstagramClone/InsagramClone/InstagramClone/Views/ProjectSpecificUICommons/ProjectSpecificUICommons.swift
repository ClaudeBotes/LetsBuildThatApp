//
//  ProjectSpecificUICommons.swift
//  InstagramClone
//
//
//  File is used to create reusable UI components across the app.
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

public func getTextFieldForSignUp(placeHolderText: String,
                                  style: inout StyleSheet, enabled: Bool) -> StyledTextField {
    
    style.backgroundColor = Brand.shared.colorPalette.signUpTextFieldDark
    style.borderColor = Brand.shared.colorPalette.signUpTextFieldDark
    style.placeholderTextColor = Brand.shared.colorPalette.secondary
    style.textColor = Brand.shared.colorPalette.white
    
    let textField = StyledTextField.createWith(style: style,
                                               enabled: enabled,
                                               font: UIFont.systemFont(ofSize: style.fontSize),
                                               placeholderText: placeHolderText)
    return textField
}

public func getStyledButton(style: inout StyleSheet, enabled: Bool) -> StyledButton {
    
    if enabled {
        style.backgroundColor = Brand.shared.colorPalette.primary
        style.borderColor = Brand.shared.colorPalette.primary
        style.textColor =  Brand.shared.colorPalette.white
    }else{
        style.backgroundColor = Brand.shared.colorPalette.primary.withAlphaComponent(0.5)
        style.borderColor = Brand.shared.colorPalette.primary.withAlphaComponent(0.5)
        style.textColor =  Brand.shared.colorPalette.white.withAlphaComponent(0.5)
    }
    
    let button = StyledButton.createWith(style: style, font: UIFont.systemFont(ofSize: style.fontSize), enabled: enabled)

    return button
}

public func setBackgroundImage(style: StyleSheet) -> UIColor {
    
    if let image = UIImage(named: style.assetName){
        return UIColor(patternImage: image)
    }else{
        return Brand.shared.colorPalette.light
    }
}
