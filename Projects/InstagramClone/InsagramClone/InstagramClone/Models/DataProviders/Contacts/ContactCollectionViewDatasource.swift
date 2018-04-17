//
//  ContactCollectionViewDatasource.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

class ContactTableViewDatasource: GenericTableViewDatasource {
    
    let contacts = ContactAPI.shared.getContacts()
    
    override func footerClasses() -> [GenericTableViewCell.Type]? {
        return [ContactFooter.self]
    }
    
    override func headerClasses() -> [GenericTableViewCell.Type]? {
        return [ContactHeader.self]
    }
    
    override func cellClasses() -> [GenericTableViewCell.Type] {
        return [ContactCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return contacts[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return contacts.count
    }
    
}
