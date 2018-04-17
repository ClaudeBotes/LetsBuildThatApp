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
    
    var productForTransactions: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.delegate = self
        
        if let product = productForTransactions {
            print(product.alias! + " got this account")
        }
        
        // MARK: Style Navigation Bar
    
        self.navigationController!.navigationBar.isTranslucent = false
        self.collectionView?.backgroundColor = Brand.shared.colorPalette.light
        
        // MARK: Remove bottom border line of navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // MARK: Specify data source for cell classes
        
        let transactionsDatasource = TransactionCollectionViewDatasource()
        self.datasource = transactionsDatasource
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        
    }
    
    // Set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                                       componentName: "tableHeader")
        return CGSize(width: view.frame.width, height: layout.height)
    }
    
    // Set footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                            componentName: "tableFooter")
        return CGSize(width: view.frame.width,height: layout.height)
    }
    
    // Set cell size
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.Transactions.rawValue,
                            componentName: "tableCell")
        return CGSize(width: view.frame.width, height: layout.height)
    }
    
    // Set space between rows
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
