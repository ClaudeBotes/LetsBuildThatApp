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
        let style = StyleSheet (screenName: ApplicationScreen.AccountSummary.rawValue,
                           componentName: "screen")
        
        navigationItem.title = style.title
        self.navigationController!.navigationBar.isTranslucent = false
    
        // Setup data source for collection view configurations
        productsDataSource = AccountSummaryCollectionViewDatasource()
        self.datasource = productsDataSource
    }
    
    // Set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                       componentName: "tableHeader")
        return CGSize(width: view.frame.width, height: layout.height)
    }
    
    // Set footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                       componentName: "tableFooter")
        return CGSize(width: view.frame.width, height: layout.height)
    }
    
    // Set cell size
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.AccountSummary.rawValue,
                                     componentName: "tableCell")
        return CGSize(width: view.frame.width, height: layout.height)
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
