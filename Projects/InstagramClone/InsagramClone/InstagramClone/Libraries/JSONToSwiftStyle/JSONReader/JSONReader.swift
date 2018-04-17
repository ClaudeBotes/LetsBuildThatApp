//
//  JSONReader.swift
//  InstagramClone
//
//  This file is used specifically to read data from JSON files.
//
//  Created by Claude Botes on 14/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

final class JSONReader {
    
    static let shared = JSONReader()
    private var designSpecificationForComponents: DesignSpecificationForComponents
    private var designSpecificationForBrand: DesignSpecificationForBrand
    
    
    private init() {
        self.designSpecificationForComponents = DesignSpecificationForComponents()
        self.designSpecificationForBrand = DesignSpecificationForBrand()
    }

    
    //MARK: Design Specification Methods
    
    /**
     Retrives JSON data for design specification and sets a DesignSpecification for local usage.
     */
    func loadJSONDataForDesignSpecification(designSpecFileName: String){
        
        let designSpecificationJSONData: [DesignSpecificationForJSON] = {
            
            guard let path = Bundle.main.path(forResource: StyleSheets.DesignSpecification.rawValue, ofType: "json") else { return [] }
            let url = URL(fileURLWithPath: path)
            
            guard let data = try? Data(contentsOf: url) else { return [] }
            
            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([DesignSpecificationForJSON].self, from: data)
                return sections
            }catch{
                print(error)
            }
            return []
        }()
        
        buildDesignSpecificationForComponents(designSpecificationData: designSpecificationJSONData[0].views)
    }
    
    /**
     Loads JSON data for all components into a local object for easy usage.
     
     @param designSpecificationData JSON data needed to convert into a local design specification for easy use.
     */
    private func buildDesignSpecificationForComponents(designSpecificationData: [ViewForJSON]?){
        if let views = designSpecificationData {
            
            // Loop trough views loaded from spec
            for view in views{
                
                // Create design spec for each screen
                var designSpecForScreen = DesignSpecificationForScreen()
                
                // Assign a name to the design spec for screen
                if let viewName = view.name {
                    designSpecForScreen.screenName = viewName
                }
                
                // If components exist for a given view
                if let componentsLoaded = view.components{
                    
                    // Loop through each component that exist for a screen spec
                    for componentLoaded in componentsLoaded {
                        var component = DesignSpecificationForComponent()
                        
                        // If a name exist for component
                        if let componentName = componentLoaded.name {
                            component.name = componentName
                        }
                        
                        // If a style exist for component
                        if let styleForComponent = componentLoaded.style {
                            let style = buildDesignSpecForStyle(style: styleForComponent)
                            component.style = style
                        }
                        
                        // If a layout exist for label
                        if let layoutForComponent = componentLoaded.layout {
                            let layout = buildDesignSpecForLayout(layout: layoutForComponent)
                            component.layout = layout
                        }
                        
                        designSpecForScreen.components.append(component)
                    }
                }
                
                // append screens spec to design specification
                designSpecificationForComponents.screenSpecifications.append(designSpecForScreen)
            }
        }
    }
    
    /**
     Loads JSON data related to style into a local object for easy usage.
     
     @param style JSON data needed to convert style data into a local design specification for easy use.
     */
    private func buildDesignSpecForStyle(style: StyleForJSON) -> DesignSpecificationForStyle{
        var styleSpec = DesignSpecificationForStyle()
        
        /**
         Text
         */
        if let textForComponent = style.text {
            styleSpec.text = textForComponent
        }
        
        /**
         Font Size
         */
        if let fontSizeForComponent = style.fontSize {
            
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let fontSize = try convertFontSizeCssStringToCGFloat(value: fontSizeForComponent)
                styleSpec.fontSize = fontSize
            }
            catch{
                print(error)
            }
        }
        
        /**
         Text Alignment
         */
        if let textAlignment = style.textAlighnment {
            styleSpec.textAlighnment = setTextAlignment(textAlignment: textAlignment)
        }
        
        /**
         Shadow Radius
         */
        if let shadowRadius = style.shadowRadius {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let radius = try convertStringToCGFloat(value: shadowRadius)
                styleSpec.shadowRadius = radius
            }
            catch{
                print(error)
            }
        }
        
        /**
         Shadow Opacity
         */
        if let shadowOpacity = style.shadowOpacity {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let opacity = try convertStringToCGFloat(value: shadowOpacity)
                styleSpec.shadowOpacity = opacity
            }
            catch{
                print(error)
            }
        }
        
        /**
         Shadow OffsetY
         */
        if let shadowOffsetY = style.shadowOffsetY {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let offset = try convertStringToCGFloat(value: shadowOffsetY)
                styleSpec.shadowOffsetY = offset
            }
            catch{
                print(error)
            }
        }
        
        /**
         Corner Radius
         */
        if let cornerRadius = style.cornerRadius {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let radius = try convertStringToCGFloat(value: cornerRadius)
                styleSpec.cornerRadius = radius
            }
            catch{
                print(error)
            }
        }
        
        /**
         Border Width
         */
        if let borderWidth = style.borderWidth {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let width = try convertStringToCGFloat(value: borderWidth)
                styleSpec.borderWidth = width
            }
            catch{
                print(error)
            }
        }
        
        /**
         Asset Name
         */
        if let assetName = style.assetName {
            styleSpec.assetName = assetName
        }
        
        /**
         Left Padding For Text
         */
        if let leftPaddingForText = style.leftPaddingForText {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: leftPaddingForText)
                styleSpec.leftPaddingForText = padding
            }
            catch{
                print(error)
            }
        }
        
        /**
         Right Padding For Text
         */
        if let rightPaddingForText = style.rightPaddingForText {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: rightPaddingForText)
                styleSpec.rightPaddingForText = padding
            }
            catch{
                print(error)
            }
        }
        
        /**
         Line Height
         */
        if let lineHeight = style.lineHeight {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let height = try convertStringToCGFloat(value: lineHeight)
                styleSpec.lineHeight = height
            }
            catch{
                print(error)
            }
        }
        
        return styleSpec
    }
    
    
    /**
     Loads JSON data related to layout into a local object for easy usage.
     
     @param layout JSON data needed to convert layout data into a local design specification for easy use.
     */
    private func buildDesignSpecForLayout(layout: LayoutForJSON) -> DesignSpecificationForLayout{
        var layoutSpec = DesignSpecificationForLayout()
        
        /**
         Left Padding
         */
        if let paddingLeftForLabel = layout.paddingLeft {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: paddingLeftForLabel)
                layoutSpec.paddingLeft = padding
            }
            catch{
                print(error)
            }
        }
        
        /**
         Top Padding
         */
        if let paddingTopForLabel = layout.paddingTop {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: paddingTopForLabel)
                layoutSpec.paddingTop = padding
            }
            catch{
                print(error)
            }
        }
        
        /**
         Right Padding
         */
        if let paddingRightForLabel = layout.paddingRight {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: paddingRightForLabel)
                layoutSpec.paddingRight = padding
            }
            catch{
                print(error)
            }
        }
        
        /**
         Bottom Padding
         */
        if let paddingBottomForLabel = layout.paddingBottom {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: paddingBottomForLabel)
                layoutSpec.paddingBottom = padding
            }
            catch{
                print(error)
            }
        }
        
        /**
         Width Padding
         */
        if let widthForLabel = layout.width {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: widthForLabel)
                layoutSpec.width = padding
            }
            catch{
                print(error)
            }
        }
        
        /**
         Height Padding
         */
        if let heightForLabel = layout.height {
            // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
            do {
                let padding = try convertStringToCGFloat(value: heightForLabel)
                layoutSpec.height = padding
            }
            catch{
                print(error)
            }
        }
        
        return layoutSpec
    }
    
    /**
     Retrives design specification for your app.
     Call this method in your App Delegate.
     
     @return DesignSpecification Returns a struct for your Design Specification containing all design properties.
     */
    func getDesignSpecificationForComponents() -> DesignSpecificationForComponents {
        return self.designSpecificationForComponents
    }
    
    // MARK: Brand Specification Methods
    
    /**
     Retrives JSON data for design specification and sets a DesignSpecification for local usage.
     */
    func loadJSONDataForBrandSpecification(brandSpecFileName: String){
        
        let brandSpecificationJSONData: [BrandSpecificationForJSON] = {
            
            guard let path = Bundle.main.path(forResource: brandSpecFileName, ofType: "json") else { return [] }
            let url = URL(fileURLWithPath: path)
            
            guard let data = try? Data(contentsOf: url) else { return [] }
            
            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([BrandSpecificationForJSON].self, from: data)
                return sections
            }catch{
                print(error)
            }
            return []
        }()
        
        buildDesignSpecificationForBrand(brandSpecificationData: brandSpecificationJSONData[0].colors)
    }
    
    /**
     Loads JSON data for all colors into a local object for easy usage.
     
     @param brandSpecificationData JSON data needed to convert into a local brand specification for easy use.
     */
    private func buildDesignSpecificationForBrand(brandSpecificationData: ColorSpecificationForJSON?){
        if let color = brandSpecificationData {
            
            // Create design spec for colors
            var designSpecForcolorPalette = DesignSpecificationForColorPalatte()
            
            if let primary = color.primary {
                designSpecForcolorPalette.primary = UIColorFromString(hex: primary)
            }
            if let secondary = color.secondary {
                designSpecForcolorPalette.secondary = UIColorFromString(hex: secondary)
            }
            if let success = color.success {
                designSpecForcolorPalette.success = UIColorFromString(hex: success)
            }
            if let danger = color.danger {
                designSpecForcolorPalette.danger = UIColorFromString(hex: danger)
            }
            if let warning = color.warning {
                designSpecForcolorPalette.warning = UIColorFromString(hex: warning)
            }
            if let info = color.info {
                designSpecForcolorPalette.info = UIColorFromString(hex: info)
            }
            if let light = color.light {
                designSpecForcolorPalette.light = UIColorFromString(hex: light)
            }
            if let dark = color.dark {
                designSpecForcolorPalette.dark = UIColorFromString(hex: dark)
            }
            if let white = color.white {
                designSpecForcolorPalette.white = UIColorFromString(hex: white)
            }
            if let signUpTextFieldDark = color.signUpTextFieldDark {
                designSpecForcolorPalette.signUpTextFieldDark = UIColorFromString(hex: signUpTextFieldDark)
            }
            
            self.designSpecificationForBrand.colorPalatteSpecification = designSpecForcolorPalette
        }
    }
    
    /**
     Retrives brand specification for your app.
     Call this method in your App Delegate.
     
     @return DesignSpecificationForComponents Returns a struct for your Brand Specification containing all brand properties.
     */
    func getDesignSpecificationForBrand() -> DesignSpecificationForBrand {
        return self.designSpecificationForBrand
    }
    
    // MARK: Other
    
    /**
     Retrives style properties related to a given component.
     Use this method if you choose to store a style for a given component in its own file.
     
     @param componentName Name of the component that will be used for the filename ( JSON File ) in which its style properties can be found.
     
     @return StyleForJSON Returns a struct for your TextStyle
     */
    func getTextStyleJSONDataFor(componentName: String) -> [StyleForJSON]{
        
        let styleJSONData: [StyleForJSON] = {
            
            guard let path = Bundle.main.path(forResource: componentName, ofType: "json") else { return [] }
            let url = URL(fileURLWithPath: path)
            
            guard let data = try? Data(contentsOf: url) else { return [] }
            
            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([StyleForJSON].self, from: data)
                return sections
            }catch{
                print(error)
            }
            
            return []
        }()
        return styleJSONData
    }
    
}
