//
//  AccSumStyleSheetse.swift
//  InstagramClone
//
//
//  This file is used to create style sheets for all components on Account Summary Screen.
//
//  Created by Claude Botes on 15/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

/**
 Override colors if you plan to use any to ensire they are from Brand Specification
 - TextColor()
 - ShadowColor()
 - BorderColor()
 - BackgroundColor()
 */

struct AccountSummaryComponents {
    
    /**
     Enum to loop thorugh when retrieving design spec for screen.
     */
    enum Component: String {
        case accountSummaryHeader = "accountSummaryHeader"
        case accountSummaryCell = "accountSummaryCell"
        case availableBalance = "availableBalance"
        case accountName = "accountName"
        case accountNumber = "accountNumber"
        case openedDate = "openedDate"
        case accountCard = "accountCard"
        case marketingContent = "marketingContent"
    }
}

final class AccSumMarketingContentStyle: BaseStyleSheet {
    
    static let shared = AccSumMarketingContentStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.marketingContent.rawValue)
    }
    
    override func ShadowColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.dark
    }
    
    override func BackgroundColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.light
    }
}

final class AccSumAvailableBalanceStyle: BaseStyleSheet {
    
    static let shared = AccSumAvailableBalanceStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.availableBalance.rawValue)
    }
    
    override func TextColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.primary
    }
}

final class AccSumAccountNameStyle: BaseStyleSheet {
    
    static let shared = AccSumAccountNameStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.accountName.rawValue)
    }
    
    override func TextColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.primary
    }
}

final class AccSumAccountNumberStyle: BaseStyleSheet {
    
    static let shared = AccSumAccountNumberStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.accountNumber.rawValue)
    }
    
    override func TextColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.secondary
    }
}

final class AccSumOpenedDateStyle: BaseStyleSheet {
    
    static let shared = AccSumOpenedDateStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.openedDate.rawValue)
    }
    
    override func TextColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.secondary
    }
}

final class AccSumAccountCardStyle: BaseStyleSheet {
    
    static let shared = AccSumAccountCardStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.accountCard.rawValue)
    }
    
    override func BackgroundColor() -> UIColor {
        return UIColor.white
    }
    
    override func ShadowColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.dark
    }
}

final class AccSumHeaderStyle: BaseStyleSheet {
    
    static let shared = AccSumHeaderStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.accountSummaryHeader.rawValue)
    }
    
    override func BackgroundColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.light
    }
}

final class AccSumCellStyle: BaseStyleSheet {
    
    static let shared = AccSumCellStyle()
    
    private init() {
        super.init(screenName: ApplicationScreen.AccountSummary.rawValue,
                   componentName: AccountSummaryComponents.Component.accountSummaryCell.rawValue)
    }
    
    override func BackgroundColor() -> UIColor {
        return BrandSpecification.shared.colorPalette.light
    }
}
