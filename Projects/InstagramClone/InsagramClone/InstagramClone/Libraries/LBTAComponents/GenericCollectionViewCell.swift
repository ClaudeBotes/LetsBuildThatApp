//
//  DatasourceCell.swift
//  Pods
//
//  Created by Brian Voong on 11/21/16.
//
//

import UIKit

/// GenericCollectionViewCell is the base cell class for all headers, cells, and footers used in GenericCollectionViewController and GenericCollectionViewDatasource.  Using this cell, you can access the row's model object via datasourceItem.  You can also access the controller as well.
open class GenericCollectionViewCell: UICollectionViewCell {
    
    open var datasourceItem: Any?
    open weak var controller: GenericCollectionViewController?
    
    open let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        lineView.isHidden = true
        return lineView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    ///Override this method to provide your own custom views.
    open func setupViews() {
        clipsToBounds = true
        addSubview(separatorLineView)
        separatorLineView.anchor(left: leftAnchor, top: nil, right: rightAnchor, bottom: bottomAnchor, paddingLeft: 0, paddingTop: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0.5)
    }
        
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
