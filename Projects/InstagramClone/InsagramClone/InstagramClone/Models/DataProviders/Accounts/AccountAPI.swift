//
//  Accounts.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import Firebase

final class AccountAPI {
    // 1
    static let shared = AccountAPI()
    private let accountPersistenceManager = AccountPersistenceManager()
    
    // 2
    private init() {
    }
    
     // MARK: Real API calls
    func getProductSummary() -> [AccountSummaryItems] {
        return accountPersistenceManager.getProductSummary()
    }
    
    func getProductsNotGroupedByType() -> [Product]{
        
        let productSummaryItems = accountPersistenceManager.getProductSummary() as? [AccountSummaryItems]
        var productsNotGrouped = [Product]()
        
        // If there any results exist
        if let accountTypes = productSummaryItems {
            
            // For each type returned
            for eachAccountType in accountTypes {
                
                // Get all the accounts for that type
                if let accountsForAccountType = eachAccountType.accounts {
                    
                    // If any accounts exist
                    if let products = accountsForAccountType.products {
                        
                        // Add each Product to my list of products
                        for eachProdcut in products {
                            productsNotGrouped.append(eachProdcut)
                        }
                    }
                }
            }
        }
        
        return productsNotGrouped
    }
    
    // MARK: Test API calls
    func getTestAccounts() -> [TestProduct]{
        return accountPersistenceManager.getTestProducts()
    }
}
