//
//  Transaction.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

struct Transaction {
    let name : String?
    let transactionAmount : String?
    let accountName: String?
    let accountNumber: String?
    
    init(){
        self.name = nil
        self.transactionAmount = nil
        self.accountName = nil
        self.accountNumber = nil
    }
    
    init(name: String, transactionAmount: String, accountName: String, accountNumber: String){
        self.name = name
        self.transactionAmount = transactionAmount
        self.accountName = accountName
        self.accountNumber = accountNumber
    }
}
