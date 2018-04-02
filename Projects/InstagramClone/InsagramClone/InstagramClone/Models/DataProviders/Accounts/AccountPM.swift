//
//  AccountPersistenceManager.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import Firebase

final class AccountPersistenceManager {
    private var accounts = [Account]()
    
    init() {
        //Dummy list of accounts
        let account1 = Account(name: "Current Account", availableBalance: "$ 3,841.81", accountNumber: "**** *** *** 1231", color: "27BBFF", dateOpened: "08 / 2012")
        let account2 = Account(name: "Savings Account", availableBalance: "$ 204.00", accountNumber: "**** *** *** 8954", color: "F80060", dateOpened: "07 / 2014")
        let account3 = Account(name: "Saving Goal : New Car", availableBalance: "$ 2,105.00", accountNumber: "**** *** *** 1290", color: "39CA74", dateOpened: "07 / 2017")
        let account4 = Account(name: "Shared Savings", availableBalance: "$ 8,266.40", accountNumber: "**** *** *** 3778", color: "404040", dateOpened: "01 / 2018")
        let account5 = Account(name: "Savings for House", availableBalance: "$ 80,266.40", accountNumber: "**** *** *** 3779", color: "27BBFF", dateOpened: "01 / 2018")
         let account6 = Account(name: "December Holiday Savings", availableBalance: "$ 68.40", accountNumber: "**** *** *** 3780", color: "F80060", dateOpened: "01 / 2018")
         let account7 = Account(name: "Ski Holiday Savings", availableBalance: "$ 1,246.80", accountNumber: "**** *** *** 3781", color: "39CA74", dateOpened: "01 / 2018")
        
        accounts = [account1, account2, account3, account4,account5,account6, account7]
    }
    
    func getAccounts() -> [Account] {
        return accounts
    }
}
