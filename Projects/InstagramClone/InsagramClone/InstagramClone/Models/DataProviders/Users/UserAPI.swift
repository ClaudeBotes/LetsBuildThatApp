//
//  UserAPI.swift
//  InstagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

final class UserAPI {
    // 1
    static let shared = UserAPI()
    private let userPersistenceManager = UserPersistenceManager()
    
    // 2
    private init() {
        
    }
    
    func getUsers() -> [MyUser] {
        return userPersistenceManager.getUsers()
    }
    
    func signUpNewUser(email: String,  username: String, password: String) {
        
        userPersistenceManager.signUpNewUser(email: email, username: username, password: password)
    }
}
