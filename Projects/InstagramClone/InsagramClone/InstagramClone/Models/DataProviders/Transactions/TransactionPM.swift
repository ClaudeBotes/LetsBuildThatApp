//
//  AccountPersistenceManager.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import Firebase

final class TransactionPersistenceManager {
    private var transactions = [Transaction]()
    
    init() {
        //Dummy list of transactions
        let transaction1 = Transaction(name: "Claude Botes",  transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction2 = Transaction(name: "Bart Brug", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction3 = Transaction(name: "Harneek Sigh", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction4 = Transaction(name: "Arthur King", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction5 = Transaction(name: "Ping", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction6 = Transaction(name: "Jack Johnson", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction7 = Transaction(name: "Arnold Scarfield", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction8 = Transaction(name: "Claude Botes",  transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction9 = Transaction(name: "Bart Brug", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction10 = Transaction(name: "Harneek Sigh", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction11 = Transaction(name: "Arthur King", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction12 = Transaction(name: "Ping", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction13 = Transaction(name: "Jack Johnson", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        let transaction14 = Transaction(name: "Arnold Scarfield", transactionAmount: "- 8.40", accountName: "Check Account", accountNumber: "NL91 ABNA 0417 1643 00")
        
        transactions = [transaction1, transaction2, transaction3, transaction4,transaction5,transaction6, transaction7, transaction8, transaction9, transaction10, transaction11,transaction12,transaction13, transaction14]
    }
    
    func getTransactions() -> [Transaction] {
        return transactions
    }
}
