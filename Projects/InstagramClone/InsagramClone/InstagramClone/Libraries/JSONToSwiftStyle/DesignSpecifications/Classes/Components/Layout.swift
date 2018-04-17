//
//  Layout.swift
//  InstagramClone
//
//  Created by Claude Botes on 16/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

public class Layout {

    var layout: DesignSpecificationForLayout
    let componentName: String
    let screenName: String
    
    init(screenName: String, componentName: String){
        let designSpec = getDesignSpecForComponentLayout(screenName: screenName, componentName: componentName)
        self.layout = designSpec
        self.componentName = componentName
        self.screenName = screenName
    }
    
    // MARK: Layout Methods
    
    var paddingLeft: CGFloat {
        get {
            return self.layout.paddingLeft
        }
        set {
            self.layout.paddingLeft = newValue
        }
    }
    var paddingTop: CGFloat {
        get {
            return self.layout.paddingTop
        }
        set {
            self.layout.paddingTop = newValue
        }
    }
    var paddingRight: CGFloat {
        get {
            return self.layout.paddingRight
        }
        set {
            self.layout.paddingRight = newValue
        }
    }
    var paddingBottom: CGFloat {
        get {
            return self.layout.paddingBottom
        }
        set {
            self.layout.paddingBottom = newValue
        }
    }
    var width: CGFloat {
        get {
            return self.layout.width
        }
        set {
            self.layout.width = newValue
        }
    }
    var height: CGFloat {
        get {
            return self.layout.height
        }
        set {
            self.layout.height = newValue
        }
    }
}
