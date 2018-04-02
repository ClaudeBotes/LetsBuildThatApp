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
    
    func getAccounts() -> [Account] {
        return accountPersistenceManager.getAccounts()
    }
}
