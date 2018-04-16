//
//  HomeVC.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class AccountSummaryViewController: GenericCollectionViewController {
    
    var productsDataSource: AccountSummaryCollectionViewDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Style Navigation Bar
        navigationItem.title = "Accounts"
        self.navigationController!.navigationBar.isTranslucent = false
    
        // Setup data source for collection view configurations
        productsDataSource = AccountSummaryCollectionViewDatasource()
        self.datasource = productsDataSource
    }
    
    // Set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 189)
    }
    
    // Set footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    // Set cell size
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 155)
    }
    
    // Set space between rows
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let product = productsDataSource?.products[indexPath.item] as Product? {
            var transactionsViewController = TransactionsViewController()
            transactionsViewController.productForTransactions = product
            navigationController?.pushViewController(transactionsViewController, animated: true)
        }
    }
}
