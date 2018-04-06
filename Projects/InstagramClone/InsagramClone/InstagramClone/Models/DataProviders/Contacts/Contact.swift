//
//  Contact.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

struct Contact {
    let name : String?
    let accountNumber : String?
    
    init(){
        self.name = nil
        self.accountNumber = nil
    }
    
    init(name: String, accountNumber: String){
        self.name = name
        self.accountNumber = accountNumber
    }
}
