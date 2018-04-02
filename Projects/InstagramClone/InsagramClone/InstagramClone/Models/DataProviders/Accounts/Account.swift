//
//  Account.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

struct Account {
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
