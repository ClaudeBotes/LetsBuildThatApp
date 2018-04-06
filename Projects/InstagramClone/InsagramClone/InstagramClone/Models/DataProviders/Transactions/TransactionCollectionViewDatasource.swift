//
//  TransactionCollectionViewDatasource.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

class TransactionCollectionViewDatasource: GenericCollectionViewDatasource {
    
    let transactions = TransactionAPI.shared.getTransactions()
    
    override func footerClasses() -> [GenericCollectionViewCell.Type]? {
        return [TransactionFooter.self]
    }
    
    override func headerClasses() -> [GenericCollectionViewCell.Type]? {
        return [TransactionHeader.self]
    }
    
    override func cellClasses() -> [GenericCollectionViewCell.Type] {
        return [TransactionCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return transactions[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return transactions.count
    }
    
}
