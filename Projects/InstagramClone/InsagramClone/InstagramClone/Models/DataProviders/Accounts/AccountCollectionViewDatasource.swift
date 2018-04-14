//
//  AccountCollectionViewDatasource.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

class AccountSummaryCollectionViewDatasource: GenericCollectionViewDatasource {
    
    let products = AccountAPI.shared.getProductsNotGroupedByType()
    
    override func footerClasses() -> [GenericCollectionViewCell.Type]? {
        return [AccountSummaryFooter.self]
    }
    
    override func headerClasses() -> [GenericCollectionViewCell.Type]? {
        return [AccountSummaryHeader.self]
    }
    
    override func cellClasses() -> [GenericCollectionViewCell.Type] {
        return [AccountSummaryCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return products[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return products.count
    }
    
}
