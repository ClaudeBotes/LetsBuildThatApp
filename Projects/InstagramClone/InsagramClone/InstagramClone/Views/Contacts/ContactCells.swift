//
//  ContactCell.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class ContactFooter: GenericCollectionViewCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
    }
}

class ContactHeader: GenericCollectionViewCell {
    
//    let screenTitle: StyledLabel = {
//        let label = StyledLabel()
//        //label.font = ApplicationTheme.Fonts.LargeTitle()
//
//        label.font = UIFont.boldSystemFont(ofSize: 34)
//        label.textColor = ApplicationTheme.Colors.White()
//        label.text = "Contacts"
//        return label
//    }()
//
//    let newContactButton: StyledButton = {
//        let button = StyledButton.createWith(
//            backgroundColor: ContactCellTheme.Colors.NewContactButtonBackgroundColor(),
//            borderColor: ContactCellTheme.Colors.NewContactButtonBackgroundColor(),
//            cornerRadius: ContactCellTheme.NewContactButtonStyle.CornerRadius(),
//            title: "New Contact",
//            font: UIFont.systemFont(ofSize: ContactCellTheme.NewContactButtonStyle.FontSize()),
//            titleColor: ContactCellTheme.Colors.NewContactButtonTextColor(),
//            titleAlignment: .center,
//            isEnabled: false )
//
//        return button
//    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = ApplicationTheme.Colors.PrimaryColor2()
        
//        // Add screen title
//        
//        addSubview(screenTitle)
//        screenTitle.anchor(left: self.leftAnchor, top: self.topAnchor, right: self.rightAnchor, bottom: nil, paddingLeft: 16, paddingTop: 2, paddingRight: 16, paddingBottom: 15, width: 0, height: 41)
//        
//        // Add new contact button
//        
//        addSubview(newContactButton)
//        newContactButton.anchor(left: self.leftAnchor, top: screenTitle.bottomAnchor, right: self.rightAnchor, bottom: self.bottomAnchor, paddingLeft: 16, paddingTop: 25, paddingRight: 16, paddingBottom: 16, width: 0, height: 44)
    }
}

class ContactCell: GenericCollectionViewCell {
    
    override var datasourceItem: Any? {
        didSet {
            let contactItem = datasourceItem as? Contact
            
            contactNameLabel.text = contactItem?.name
            
            if let contactName = contactItem?.name {
                contactNameLabel.text = contactName
            } else {
                contactNameLabel.text = "Contact Name Unavailable"
            }
        
            if let contactNumber = contactItem?.accountNumber {
                accountNumberLabel.text = contactNumber
            } else {
                accountNumberLabel.text = "Account Number Unavailable"
            }
        }
    }
    
    let profilePicture: DesignableView = {
        let view = DesignableView()
        view.cornerRadius = 16.6 // width / 2 to make a view round
        view.clipsToBounds = true
        view.borderWidth = 1
        view.borderColor = .gray
        view.backgroundColor = .gray
        
        return view
    }()
    
    let contactNameLabel: StyledLabel = {
        let label = StyledLabel()
        label.font = UIFont.systemFont(ofSize: ContactCellTheme.TextFieldStyle.ContactNameFont())
        label.textColor = ContactCellTheme.Colors.ContactNameColor()
        label.text = "John Steward"
        label.textAlignment = .left
        return label
    }()
    
    let accountNumberLabel: StyledLabel = {
        let label = StyledLabel()
        label.font = UIFont.systemFont(ofSize: ContactCellTheme.TextFieldStyle.AccountNumberFont())
        label.textColor = ContactCellTheme.Colors.AccountNumberColor()
        label.text = "NL91 ABNA 0417 1643 00"
        label.textAlignment = .left
        return label
    }()
    
    let rowDevider: DesignableView = {
        let view = DesignableView()
        view.backgroundColor = ContactTheme.Colors.RowSeperatorColor()
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = ContactCellTheme.Colors.CellBackgroundColor()
        
        // Add cotnact name
        
        addSubview(contactNameLabel)
        contactNameLabel.anchor(left: self.leftAnchor, top: self.topAnchor, right: self.rightAnchor, bottom: nil, paddingLeft: 65, paddingTop: 8, paddingRight: 15, paddingBottom: 0, width: 0, height: 20)
        
        // Add account number
        
        addSubview(accountNumberLabel)
        accountNumberLabel.anchor(left: self.leftAnchor, top: contactNameLabel.bottomAnchor, right: self.rightAnchor, bottom: nil, paddingLeft: 65, paddingTop: 3, paddingRight: 15, paddingBottom: 0, width: 0, height: 28)
        
        // Add row devider name
        addSubview(rowDevider)
        rowDevider.anchor(left: self.leftAnchor, top: nil, right: self.rightAnchor, bottom: self.bottomAnchor, paddingLeft: 65, paddingTop: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        
        // Add profile picture view
        
        addSubview(profilePicture)
        profilePicture.anchor(left: self.leftAnchor, top: self.topAnchor, right: contactNameLabel.leftAnchor, bottom: self.bottomAnchor, paddingLeft: 16, paddingTop: 14, paddingRight: 16, paddingBottom: 14, width: 0, height: 0)
    }
}
