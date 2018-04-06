//
//  ContactAPI.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import Firebase

final class ContactAPI {
    // 1
    static let shared = ContactAPI()
    private let contactPersistenceManager = ContactPersistenceManager()
    
    // 2
    private init() {
    }
    
    func getContacts() -> [Contact] {
        return contactPersistenceManager.getContacts()
    }
}
