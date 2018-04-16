//
//  FilesAndScreens.swift
//  InstagramClone
//
//  This file is used to register design specification locations and screen names to be loaded from JSON.
//
//  Created by Claude Botes on 15/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

// Used to identify screens in the design spec
public enum ApplicationScreen: String {
    case AccountSummary = "accountSummary"
    case Transactions = "transactions"
}

public enum StyleSheets: String {
    case Brand = "BrandSpecification"
    case DesignSpecification = "DesignSpecification"
    case DesignSpecificationPlayground = "DesignSpecificationPlayground"
}

public enum ValueNotSet: String {
    case AccountName = "Check Account"
    case AccountNumber = "**** **** **** ****"
    case BalanceAmount = "1234"
    case Date = "01 / 2018"
}

// This is a hack to fix a bug in ios11 where the scrollbar appears behind the collectionview header
class CustomLayer: CALayer {
    override var zPosition: CGFloat {
        get { return 0 }
        set {}
    }
}
