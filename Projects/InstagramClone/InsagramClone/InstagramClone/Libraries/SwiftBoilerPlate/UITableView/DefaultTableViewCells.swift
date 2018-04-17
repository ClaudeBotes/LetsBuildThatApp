//
//  DefaultTableViewCells.swift
//  SwiftBoilerPlates
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 cfb. All rights reserved.
//

import UIKit

class DefaultTableViewHeader: DefaultTableViewCell {
    
    override var datasourceItem: Any? {
        didSet {
            if datasourceItem == nil {
                label.text = "This is your default header"
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        label.text = "Header Cell"
        label.textAlignment = .center
    }
}

class DefaultTableViewFooter: DefaultTableViewCell {
    
    override var datasourceItem: Any? {
        didSet {
            if datasourceItem == nil {
                label.text = "This is your default footer"
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        label.text = "Footer Cell"
        label.textAlignment = .center
    }
}

class DefaultTableViewCell: GenericTableViewCell {
    
    override var datasourceItem: Any? {
        didSet {
            if let text = datasourceItem as? String {
                label.text = text
            } else {
                label.text = datasourceItem.debugDescription
            }
        }
    }
    
    let label = UILabel()
    
    override func setupViews() {
        super.setupViews()
        addSubview(label)
        label.anchor(left: leftAnchor, top: topAnchor, right: rightAnchor, bottom: bottomAnchor, paddingLeft: 10, paddingTop: 0, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
    
}
