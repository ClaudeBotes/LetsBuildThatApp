//
//  TransactionsVC.swift
//  InstagramClone
//
//  Created by Claude Botes on 06/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class TransactionsViewController: GenericCollectionViewController {
    
    
    let maxHeaderHeight: CGFloat = 145
    let minHeaderHeight: CGFloat = 76
    var previousScrollOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.hidesBarsOnSwipe = true
        
        self.collectionView?.delegate = self
        
        
        
        
        // Style Navigation Bar
        navigationItem.title = ""
        self.navigationController!.navigationBar.isTranslucent = false
        
        self.collectionView?.backgroundColor = UIColor(hex: "F5F5F5")
        
        // Remove bottom border line of navigation bar
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // Specify data source for cell classes
        
        let transactionsDatasource = TransactionCollectionViewDatasource()
        self.datasource = transactionsDatasource
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolled")
        
        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        
        // Header height logic here next
        
        if let headerView = collectionView?.visibleSupplementaryViews(ofKind: UICollectionElementKindSectionHeader).first as? TransactionHeader {
            
            // Automagically get the right height
            let height = headerView.contentView.systemLayoutSizeFitting(UILayoutFittingExpandedSize).height
            headerView  // what the fuck do i access here to set the height?
            
        }
        
        //self.previousScrollOffset = scrollView.contentOffset.y
        
    }
    
    // Set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 145)
    }
    
    // Set footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    // Set cell size
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    // Set space between rows
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
