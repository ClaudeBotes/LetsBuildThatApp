//
//  TransactionAPI.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import Firebase

final class TransactionAPI {
    // 1
    static let shared = TransactionAPI()
    private let transactionPersistenceManager = TransactionPersistenceManager()
    
    // 2
    private init() {
    }
    
    func getTransactions() -> [Transaction] {
        return transactionPersistenceManager.getTransactions()
    }
}
