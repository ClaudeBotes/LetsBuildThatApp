//
//  Account.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

 // MARK: Structs for reading JSON

struct AccountSummaryItems : Codable {
    var aggregatedBalance: AggregatedBalance?
    var accounts: Accounts?
    
    enum CodingKeys: String, CodingKey {
        case aggregatedBalance, accounts
    }
}

struct AggregatedBalance : Codable {
    var currency: String?
    var value: String?
    
    enum CodingKeys: String, CodingKey {
        case currency, value
    }
}

struct Accounts : Codable {
    var type: String?
    var products: [Product]?
    var aggregatedBalance: AggregatedBalance?
    
    enum CodingKeys: String, CodingKey {
        case type,products, aggregatedBalance
    }
}

struct Product : Codable {
    var bookedBalance: String?
    var availableBalance: String?
    var accountNumber: String?
    var currency: String?
    var id: String?
    var alias: String?
    var visible: Bool?
    var dateOpened: String?
    
    enum CodingKeys: String, CodingKey {
        case bookedBalance , availableBalance, currency, id, alias, visible, dateOpened
        case accountNumber = "IBAN"
    }
}

 // MARK:Struct for testing UI before having JSON
 
struct TestProduct {
    let name : String?
    let availableBalance : String?
    let accountNumber : String?
    let color : String?
    let dateOpened: String?
    
    init(){
        self.name = nil
        self.availableBalance = nil
        self.accountNumber = nil
        self.color = nil
        self.dateOpened = nil
    }
    
    init(name: String, availableBalance: String, accountNumber: String, color: String, dateOpened: String){
        self.name = name
        self.availableBalance = availableBalance
        self.accountNumber = accountNumber
        self.color = color
        self.dateOpened = dateOpened
    }
}
