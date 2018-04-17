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
    case Contacts = "contacts"
    case SignUp = "signUp"
}

public enum StyleSheets: String {
    case BrandSpecification = "BrandSpecification"
    case DesignSpecification = "DesignSpecification"
    case DesignSpecificationPlayground = "DesignSpecificationPlayground"
}

public enum ValueNotSet: String {
    case AccountName = "Check Account"
    case AccountNumber = "DE87 2018 3492 0001"
    case BalanceAmount = "$ 3,174.60"
    case Date = "01 / 2018"
    case BenificiaryName = "Bruce Wayne"
}

// This is a hack to fix a bug in ios11 where the scrollbar appears behind the collectionview header
class CustomLayer: CALayer {
    override var zPosition: CGFloat {
        get { return 0 }
        set {}
    }
}


