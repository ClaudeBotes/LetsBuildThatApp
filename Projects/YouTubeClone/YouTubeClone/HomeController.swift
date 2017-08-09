//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Claude on 28/6/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
 
    // MARK: Variables
    
    let cellId = "cellId"
    
    let screenTitles = ["Home", "Trending", "Subscriptions", "Account"]
    
    // MARK: View Controller Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        // MARK: Setup home screen label
        
        // * subtracting 32 to have the spacing at the begining of the label
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        setupCollectionView()
        
        // MARK: Add menu bar
        setupMenuBar()
        setupNavBarButtons()
    }
    
    //MARK: Setup Views
    
    lazy var menuBar: MenuBar = {
        let menubar = MenuBar()
        menubar.homeController = self
        return menubar
    }()
    
    func setupCollectionView(){
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
        // Make provision for menubar by pushing collectionview down
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        collectionView?.isPagingEnabled = true
    }
    
    private func setupMenuBar(){
        navigationController?.hidesBarsOnSwipe = true
        
        
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: redView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupNavBarButtons(){
        // Search Button
        let searchBarButtongItem = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearch))
        // More Button
        let moreBarButtongItem = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreBarButtongItem,searchBarButtongItem]
        
    }

    
    // MARK: My Methods

    func handleSearch(){
        print("search")
    }
    
    /**
     Scrolls to the correct menu index - method can be ised inside this class or references from another class
     */
    func scrollToMenuIndex(menuIndex: Int)  {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)
    }
    
    /**
     Sets the correct screen title based on the correct menu item selected
     */
    func setScreenTitleForIndex(menuIndex: Int){
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(screenTitles[menuIndex])"
        }
    }
    
    lazy var settingsLauncher: SettingsController = {
        let launcher = SettingsController()
        launcher.homeController = self
        return launcher
    }()
    
    /**
     Handle for when a user clicks on the more button
     */
    func handleMore(){
        settingsLauncher.showSettings()
    }
    
    func showControllerForSetting(setting: Setting){
        let settingsViewController = UIViewController()
        settingsViewController.navigationItem.title = setting.name.rawValue
        settingsViewController.view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    // MARK: Scroll View Events
    
    /**
     scrollViewDidScroll: Tells the delegate when the user scrolls the content view within the receiver.
     */
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    /**
     At the end of drag - set the selected menu cell / color the selected menu cell
     */
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())
        setScreenTitleForIndex(menuIndex: Int(index))
    }
    
    // MARK: Collection View Events
    
    /**
     CollectionView: numberOfItemsInSection
     */
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    /**
     CollectionView: cellForItemAt IndexPath
     */
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    
        return cell
    }
    
    /**
     CollectionView: sizeForItemAt
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50) // the 50 comes from the size of the menubar
    }
    
    
    
}



