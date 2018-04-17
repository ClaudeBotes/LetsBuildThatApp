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

@IBDesignable public class StyledTextField: SpringTextField {
    
    @IBInspectable public var placeholderColor: UIColor = UIColor.clear {
        didSet {
            guard let placeholder = placeholder else { return }
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor: placeholderColor])
            layoutSubviews()
            
        }
    }
    
    @IBInspectable public var sidePadding: CGFloat = 0 {
        didSet {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: sidePadding, height: sidePadding))
            
            leftViewMode = UITextFieldViewMode.always
            leftView = padding
            
            rightViewMode = UITextFieldViewMode.always
            rightView = padding
        }
    }
    
    @IBInspectable public var leftPadding: CGFloat = 0 {
        didSet {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 0))
            
            leftViewMode = UITextFieldViewMode.always
            leftView = padding
        }
    }
    
    @IBInspectable public var rightPadding: CGFloat = 0 {
        didSet {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 0))
            
            rightViewMode = UITextFieldViewMode.always
            rightView = padding
        }
    }
    
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
   
    @IBInspectable public var lineHeight: CGFloat = 1.5 {
        didSet {
            let font = UIFont(name: self.font!.fontName, size: self.font!.pointSize)
            guard let text = self.text else { return }
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineHeight
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedString.addAttribute(NSAttributedStringKey.font, value: font!, range: NSRange(location: 0, length: attributedString.length))
            
            self.attributedText = attributedString
        }
    }
    
}

extension StyledTextField {
    static public func createWith(font: UIFont? = nil,
                                  textColor: UIColor? = .white,
                                  placeholderText: String? = nil,
                                  placeholderTextColor: UIColor? = .white,
                                  lineHeight: CGFloat = 1.5,
                                  cornerRadius: CGFloat = 0,
                                  borderWidth: CGFloat = 0,
                                  borderColor: UIColor = UIColor.clear,
                                  leftPaddingForText: CGFloat = 0,
                                  rightPaddingForText: CGFloat = 0,
                                  backgroundColor: UIColor = UIColor.clear,
                                  isEnabled: Bool = true) -> StyledTextField {
        
        let textField = StyledTextField()
        textField.backgroundColor = backgroundColor
        textField.font = font
        textField.textColor = textColor
        textField.lineHeight = lineHeight
        textField.cornerRadius = cornerRadius
        textField.borderWidth = borderWidth
        textField.borderColor = borderColor
        textField.leftPadding = leftPaddingForText
        textField.rightPadding = rightPaddingForText
        textField.isEnabled = isEnabled
        
        if let placeholderValue = placeholderText, let placeholderValueColor = placeholderTextColor {
             textField.attributedPlaceholder = NSAttributedString(string: placeholderValue,
                                                      attributes: [NSAttributedStringKey.foregroundColor: placeholderValueColor])
        }
        
        return textField
    }
    
    static public func createWith(style: StyleSheet,
                                  enabled: Bool,
                                  font: UIFont,
                                  placeholderText: String? = nil) -> StyledTextField {
        
        let textField = StyledTextField()
        textField.backgroundColor = style.backgroundColor
        textField.font = font
        textField.textColor = style.textColor
        textField.lineHeight = style.lineHeight
        textField.cornerRadius = style.cornerRadius
        textField.borderWidth = style.cornerRadius
        textField.borderColor = style.borderColor
        textField.leftPadding = style.leftPaddingForText
        textField.rightPadding = style.rightPaddingForText
        textField.isEnabled = enabled
        
        if let placeholderValue = placeholderText {
            textField.attributedPlaceholder = NSAttributedString(string: placeholderValue,
                                                                 attributes: [NSAttributedStringKey.foregroundColor: style.placeholderTextColor])
        }
        
        return textField
    }
}
