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
    
    private init() {
        self.designSpecificationForComponents = DesignSpecificationForComponents()
    }
    
    /**
     Retrives Brand data from JSON.
     
     @return BrandStructForJSON Returns a struct for your brand
     */
    func getBrandingJSONData() -> [BrandSpecStructForJSON]{
        
        let brandingJSONData: [BrandSpecStructForJSON] = {
            
            guard let path = Bundle.main.path(forResource: StyleSheets.Brand.rawValue, ofType: "json") else { return [] }
            let url = URL(fileURLWithPath: path)
            
            guard let data = try? Data(contentsOf: url) else { return [] }
            
            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([BrandSpecStructForJSON].self, from: data)
                return sections
            }catch{
                print(error)
            }
            
            return []
        }()
        return brandingJSONData
    }
    
    /**
     Retrives style properties related to a given label.
     Use this method if you choose to store a style for a given label in its own file.
     
     @param labelName Name of the label that will be used for the filename ( JSON File ) in which its style properties can be found.
     
     @return TextStyleForJSON Returns a struct for your TextStyle
     */
    func getTextStyleJSONDataFor(labelName: String) -> [TextStyleForJSON]{
        
        let textStyleJSONData: [TextStyleForJSON] = {
            
            guard let path = Bundle.main.path(forResource: labelName, ofType: "json") else { return [] }
            let url = URL(fileURLWithPath: path)
            
            guard let data = try? Data(contentsOf: url) else { return [] }
            
            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([TextStyleForJSON].self, from: data)
                return sections
            }catch{
                print(error)
            }
            
            return []
        }()
        return textStyleJSONData
    }
    
    /**
     Retrives design specification for your app.
     Call this method in your App Delegate.
     
     @return DesignSpecification Returns a struct for your Design Specification containing all design properties.
     */
    func getDesignSpecificationForComponents() -> DesignSpecificationForComponents {
        return self.designSpecificationForComponents
    }
    
    /**
     Retrives JSON data for design specification and sets a DesignSpecification for local usage.
     */
     func loadJSONDataForDesignSpecification(){
        
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
     Loads JSON data for into a local object for easy usage.
     
     @param designSpecificationData JSON data needed to convert into a local design specification for easy use.
     */
    private func buildDesignSpecificationForComponents(designSpecificationData: [ViewForJSON]?){
        if let views = designSpecificationData {
            
            // Loop trough views loaded from spec
            for view in views{
                
                // Create design spec for each screen
                var designSpecForScreen = DesignSpecificationForScreen()
                
                // Assign a name to the design spec for screen
                if let viewName = view.name{
                    designSpecForScreen.screenName = viewName
                }
                
                // If labels exist for a given view
                if let labelsLoaded = view.labels{
                    
                    // Loop through each label that exist for a screen spec
                    for labelLoaded in labelsLoaded {
                        var label = DesignSpecificationForLabel()
                        
                        // If a name exist for label
                        if let labelName = labelLoaded.name {
                            label.name = labelName
                        }
                        
                        // If a style exist for label
                        if let styleForLabel = labelLoaded.style {
                            var style = DesignSpecificationForTextStyle()
                            
                            // Check if font size is available
                            if let fontSizeForLabel = styleForLabel.fontSize {
                                
                                // Need to conver string to CGFloat ( if we want to copy and paste css value from invision )
                                do {
                                    let fontSize = try convertFontSizeCssStringToCGFloat(value: fontSizeForLabel)
                                    style.fontSize = fontSize
                                }
                                catch{
                                    print(error)
                                }
                            }
                            
                            // Check if text alignment is available
                            if let textAlignment = styleForLabel.textAlighnment {
                                style.textAlighnment = setTextAlignment(textAlignment: textAlignment)
                            }
                            label.style = style
                        }
                        designSpecForScreen.labels.append(label)
                    }
                }
                
                // append screens spec to design specification
                designSpecificationForComponents.screenSpecifications.append(designSpecForScreen)
            }
        }
    }
}
