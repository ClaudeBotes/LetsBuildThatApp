//
//  Font.swift
//  UIControlls
//
//  Created by Claude on 10/10/2017.
//  Copyright © 2017 Claude. All rights reserved.
//  Source of inspiration: https://medium.com/@topLayoutGuide/swift-custom-fonts-slightly-less-awful-f235e20027f3
//

import Foundation
import UIKit

enum DynamicType : String {
    case body = "body"
    case headline = "headline"
    //case Headline = "UIFontTextStyleHeadline"
    //case Subheadline = "UIFontTextStyleSubheadline"
    //case Footnote = "UIFontTextStyleFootnote"
    //case Caption1 = "UIFontTextStyleCaption1"
    //case Caption2 = "UIFontTextStyleCaption2"
}


enum myTextStyle : String {
    case body = "body"
}

enum FontBook: String {
    case Regular = "Avenir"
    case HeavyItalic = "AvenirNext-HeavyItalic"
    
    func of(style: UIFontTextStyle) -> UIFont {
        
        //var preferedSize: CGFloat = 0.0
        
        let preferedSize = UIFont.preferredFont(forTextStyle: style).pointSize
        
        /*
         switch style {
         case .body:
         preferedSize = UIFont.preferredFont(forTextStyle: .body).pointSize
         case .headline:
         preferedSize = UIFont.preferredFont(forTextStyle: .headline).pointSize
         default:
         print("No value for style found.")
         }*/
        
        //let textStyle = UIFontTextStyle(.body)
        //let textStyle = UIFontTextStyle(rawValue: style.rawValue)
        //let preferred = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: style.rawValue)).pointSize
        
        //print(preferedSize)
        //print(self.rawValue)
        //print(style.rawValue)
        //let pointSize  = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
        //let customFont = UIFont(name: "Chalkboard SE", size: pointSize)
        
        return UIFont(name: self.rawValue, size: preferedSize)!
    }
}
