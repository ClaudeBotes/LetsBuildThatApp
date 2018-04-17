// The MIT License (MIT)
//
// Copyright (c) 2015 Meng To (meng@designcode.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

@IBDesignable public class StyledButton: SpringButton {
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
}

extension StyledButton {
    static public func createWith(backgroundColor: UIColor = UIColor.clear,
                            borderColor: UIColor = UIColor.clear,
                            borderWidth: CGFloat = 0,
                            cornerRadius: CGFloat = 0,
                            title: String? = nil,
                            font: UIFont? = nil,
                            titleColor: UIColor? = .white,
                            titleAlignment: NSTextAlignment = .center, // Used NSTextAlignment due to SwiftStyleFromJSON implimentation
                            shadowColor: UIColor = UIColor.clear,
                            shadowRadius: CGFloat = 0,
                            shadowOpacity: CGFloat = 0,
                            shadowOffsetY: CGFloat = 0,
                            isEnabled: Bool = true) -> StyledButton {
        
        let button = StyledButton()
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = font
        button.setTitleColor(titleColor, for: .normal)
        button.borderColor = borderColor
        button.borderWidth = borderWidth
        button.cornerRadius = cornerRadius
        button.shadowColor = shadowColor
        button.shadowRadius = shadowRadius
        button.shadowOpacity = shadowOpacity
        button.shadowOffsetY = shadowOffsetY
        button.isEnabled = isEnabled
            
        switch titleAlignment {
        case .left:
            button.contentHorizontalAlignment = .left
        case .center:
            button.contentHorizontalAlignment = .center
        case .right:
            button.contentHorizontalAlignment = .right
        default:
            button.contentHorizontalAlignment = .center
        }
        
        if let buttonTitle = title {
            button.setTitle(buttonTitle, for: .normal)
        }
        
        return button
    }
    
    static public func createWith(style: StyleSheet, font: UIFont, enabled: Bool) -> StyledButton {
        
        let button = StyledButton()
        button.backgroundColor = style.backgroundColor
        button.titleLabel?.font = font
        button.setTitleColor(style.textColor, for: .normal)
        button.borderColor = style.borderColor
        button.borderWidth = style.borderWidth
        button.cornerRadius = style.cornerRadius
        button.shadowColor = style.shadowColor
        button.shadowRadius = style.shadowRadius
        button.shadowOpacity = style.shadowOpacity
        button.shadowOffsetY = style.shadowOffsetY
        button.isEnabled = enabled
        
        switch style.textAlignment {
        case .left:
            button.contentHorizontalAlignment = .left
        case .center:
            button.contentHorizontalAlignment = .center
        case .right:
            button.contentHorizontalAlignment = .right
        default:
            button.contentHorizontalAlignment = .center
        }
        
        button.setTitle(style.title, for: .normal)
        
        return button
    }

}
