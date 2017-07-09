//
//  MenuCell.swift
//  YouTubeClone
//
//  Description:
//  MenuCell defines the behaviour of a given menu cell item to be used in the menubar.
//
//  Created by Claude on 2/7/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    /**
     Sets the menu cell with the required layout constraints.
     */
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
        
        // Centers the icons for X and Y
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    // MARK: Properties
    
    /**
     Setup the image of the menu cell
     */
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return iv
    }()
    
    /**
     Sets the behaviour of the menu cell when it is highlighted.
     Menu cell should be set to white when highlighted.
     */
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    /**
     Sets the behaviour of the menu cell when it is selected.
     Menu cell should be set to white when selected.
     */
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
}
