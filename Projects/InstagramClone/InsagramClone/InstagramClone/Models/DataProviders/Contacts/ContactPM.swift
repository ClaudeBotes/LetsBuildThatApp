//
//  ContactPM.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import Firebase

final class ContactPersistenceManager {
    private var contacts = [Contact]()
    
    init() {
        //Dummy list of contacts
        let contact1 = Contact(name: "Claude Botes",  accountNumber: "NL91 ABNA 0417 1643 00")
        let contact2 = Contact(name: "Bart Brug", accountNumber: "NL91 ABNA 0417 1643 10")
        let contact3 = Contact(name: "Harneek Sigh", accountNumber: "NL91 ABNA 3452 1643 00")
        let contact4 = Contact(name: "Arthur King", accountNumber: "NL91 ABNA 2346 1643 00")
        let contact5 = Contact(name: "Ping", accountNumber: "NL91 RABO 0417 1643 87")
        let contact6 = Contact(name: "Jack Johnson", accountNumber: "NL91 ABNA 2109 1643 09")
        let contact7 = Contact(name: "Arnold Scarfield", accountNumber: "NL91 ABNA 09 1643 00")
        let contact8 = Contact(name: "Claude Botes",  accountNumber: "NL91 ABNA 0417 1643 00")
        let contact9 = Contact(name: "Bart Brug", accountNumber: "NL91 ABNA 0417 1643 10")
        let contact10 = Contact(name: "Harneek Sigh", accountNumber: "NL91 ABNA 3452 1643 00")
        let contact11 = Contact(name: "Arthur King", accountNumber: "NL91 ABNA 2346 1643 00")
        let contact12 = Contact(name: "Ping", accountNumber: "NL91 RABO 0417 1643 87")
        let contact13 = Contact(name: "Jack Johnson", accountNumber: "NL91 ABNA 2109 1643 09")
        let contact14 = Contact(name: "Arnold Scarfield", accountNumber: "NL91 ABNA 09 1643 00")
        
        contacts = [contact1, contact2, contact3, contact4,contact5,contact6, contact7, contact8, contact9, contact10, contact11,contact12,contact13, contact14]
    }
    
    func getContacts() -> [Contact] {
        return contacts
    }
}
