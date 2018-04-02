//
//  UserPersistenceManager.swift
//  InstagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import Firebase

final class UserPersistenceManager {
    private var users = [MyUser]()
    
    init() {
        //Dummy list of users
        let user1 = MyUser(email: "claudebotes87@gmail.com", username: "Claude87", password: "Polki1234")
        let user2 = MyUser(email: "Peter@gmail.com", username: "PeterPan", password: "Pete1234")
        let user3 = MyUser(email: "John@gmail.com", username: "JohnJack", password: "John1234")
        
        users = [user1, user2, user3]
    }
    
    func getUsers() -> [MyUser] {
        return users
    }
    
    func signUpNewUser(email: String, username: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user: User?, error: Error?) in
            
            if let err = error {
                print("Failed to create user:", err)
                return
            }
            
            print("Successfully created user:", user?.uid ?? "")
            
        })
    }
    
    
}
