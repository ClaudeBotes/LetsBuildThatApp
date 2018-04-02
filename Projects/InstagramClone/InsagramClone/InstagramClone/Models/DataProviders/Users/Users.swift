//
//  Users.swift
//  InstagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

struct MyUser {
    let email : String?
    let username : String?
    let password : String?
    
    init(){
        self.email = nil
        self.username = nil
        self.password = nil
    }
    
    init(email: String, username: String, password: String){
        self.email = email
        self.username = username
        self.password = password
    }
}
