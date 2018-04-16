//
//  ContactsVC.swift
//  InstagramClone
//
//  Created by Claude Botes on 05/04/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation
import UIKit

class ContactsViewController: GenericCollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Style Navigation Bar
        
        self.navigationController!.navigationBar.isTranslucent = false
        self.collectionView?.backgroundColor = BrandSpecification.shared.colorPalette.light
        
        // MARK: Remove bottom border line of navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // Specify data source for cell classes
        
        let contactsDatasource = ContactCollectionViewDatasource()
        self.datasource = contactsDatasource
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        
    }
    
    // Set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                            componentName: "tableHeader")
        return CGSize(width: view.frame.width, height: layout.Height())
    }
    
    // Set footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                            componentName: "tableFooter")
        return CGSize(width: view.frame.width, height: 0)
    }
    
    // Set cell size
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = Layout(screenName: ApplicationScreen.Contacts.rawValue,
                            componentName: "tableCell")
        return CGSize(width: view.frame.width, height: 60)
    }
    
    // Set space between rows
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
