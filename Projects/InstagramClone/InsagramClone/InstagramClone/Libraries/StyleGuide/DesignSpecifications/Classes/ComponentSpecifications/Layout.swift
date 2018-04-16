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
    
    func PaddingLeft() -> CGFloat {
        return self.layout.paddingLeft
    }
    func PaddingTop() -> CGFloat {
        return self.layout.paddingTop
    }
    func PaddingRight() -> CGFloat {
        return self.layout.paddingRight
    }
    func PaddingBottom() -> CGFloat {
        return self.layout.paddingBottom
    }
    func Width() -> CGFloat {
        return self.layout.width
    }
    func Height() -> CGFloat {
        return self.layout.height
    }
}
