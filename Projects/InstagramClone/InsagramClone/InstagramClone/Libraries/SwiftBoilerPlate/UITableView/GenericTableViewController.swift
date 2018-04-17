//
//  GenericTableViewController.swift
//  SwiftBoilerPlates
//
//  Created by Claude Botes on 17/04/2018.
//  Copyright © 2018 cfb. All rights reserved.
//

import UIKit

/**
 GenericTableViewController is simply a UITableViewController that allows you to quickly create list views.
 
 In order to render our items in your list, simply provide it with a Datasource object.
 */
open class GenericTableViewController: UITableViewController {
    
    open let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        aiv.hidesWhenStopped = true
        aiv.color = .black
        return aiv
    }()
    
    open var datasource: GenericTableViewDatasource? {
        didSet {
            if let cellClasses = datasource?.cellClasses() {
                for cellClass in cellClasses {
                    tableView?.register(cellClass, forCellReuseIdentifier:  NSStringFromClass(cellClass))
                }
            }
            
            if let headerClasses = datasource?.headerClasses() {
                for headerClass in headerClasses {
                    tableView?.register(headerClass, forCellReuseIdentifier: NSStringFromClass(headerClass))
                }
            }
            
            if let footerClasses = datasource?.footerClasses() {
                for footerClass in footerClasses {
                    tableView?.register(footerClass, forCellReuseIdentifier: NSStringFromClass(footerClass))
                }
            }
            
            tableView?.reloadData()
        }
    }
    
    //    public init() {
    //        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    //    }
    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    let defaultCellId = "defaultCellId"
    let defaultFooterId = "defaultFooterId"
    let defaultHeaderId = "defaultHeaderId"
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        tableView?.backgroundColor = .white
        tableView?.alwaysBounceVertical = true
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.anchorCenterXToSuperview()
        activityIndicatorView.anchorCenterYToSuperview()
        
        tableView?.register(DefaultTableViewCell.self, forCellReuseIdentifier: defaultCellId)
        tableView?.register(DefaultTableViewHeader.self, forCellReuseIdentifier: defaultHeaderId)
        tableView?.register(DefaultTableViewFooter.self, forCellReuseIdentifier: defaultFooterId)
    }
    
    override open func numberOfSections(in collectionView: UITableView) -> Int {
        return datasource?.numberOfSections() ?? 0
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.numberOfItems(section) ?? 0
    }
    
    //need to override this otherwise size doesn't get called
    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override open func tableView(_ collectionView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: GenericTableViewCell
        
        if let cls = datasource?.cellClass(indexPath) {
            cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(cls), for: indexPath) as! GenericTableViewCell
        } else if let cellClasses = datasource?.cellClasses(), cellClasses.count > indexPath.section {
            let cls = cellClasses[indexPath.section]
            cell = collectionView.dequeueReusableCell(withIdentifier: NSStringFromClass(cls), for: indexPath)  as! GenericTableViewCell
        } else if let cls = datasource?.cellClasses().first {
            cell = collectionView.dequeueReusableCell(withIdentifier: NSStringFromClass(cls), for: indexPath) as! GenericTableViewCell
        } else {
            cell = collectionView.dequeueReusableCell(withIdentifier: defaultCellId, for: indexPath) as! GenericTableViewCell
        }
        
        cell.controller = self
        cell.datasourceItem = datasource?.item(indexPath)
        return cell
    }
    
    //    override open func tableView(_ tableView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UITableReusableView {
    //
    //        let reusableView: GenericTableViewCell
    //
    //        if kind == UICollectionElementKindSectionHeader {
    //            if let classes = datasource?.headerClasses(), classes.count > indexPath.section {
    //                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! GenericCollectionViewCell
    //            } else if let cls = datasource?.headerClasses()?.first {
    //                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! GenericCollectionViewCell
    //            } else {
    //                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: defaultHeaderId, for: indexPath) as! GenericCollectionViewCell
    //            }
    //            reusableView.datasourceItem = datasource?.headerItem(indexPath.section)
    //
    //        } else {
    //            if let classes = datasource?.footerClasses(), classes.count > indexPath.section {
    //                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! GenericCollectionViewCell
    //            } else if let cls = datasource?.footerClasses()?.first {
    //                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! GenericCollectionViewCell
    //            } else {
    //                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: defaultFooterId, for: indexPath) as! GenericCollectionViewCell
    //            }
    //            reusableView.datasourceItem = datasource?.footerItem(indexPath.section)
    //        }
    //
    //        reusableView.controller = self
    //
    //        return reusableView
    //    }
    
    open func getRefreshControl() -> UIRefreshControl {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return rc
    }
    
    @objc open func handleRefresh() {
        
    }
    
    //    open var layout: UICollectionViewFlowLayout? {
    //        get {
    //            return collectionViewLayout as? UICollectionViewFlowLayout
    //        }
    //    }
}
