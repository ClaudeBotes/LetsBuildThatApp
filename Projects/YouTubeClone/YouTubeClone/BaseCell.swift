//
//  BaseCell.swift
//  YouTubeClone
//
//  Created by Claude on 2/7/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell{
    
    // MARK: Base constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not bee implemented")
    }
}
