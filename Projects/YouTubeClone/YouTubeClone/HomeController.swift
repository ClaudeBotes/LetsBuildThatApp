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
    
    var videos: [Video]?
    
    // MARK: View Controller Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        navigationController?.navigationBar.isTranslucent = false
        
        // MARK: Setup home screen label
        
        // * subtracting 32 to have the spacing at the begining of the label
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        // Make provision for menubar by pushing collectionview down
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        // MARK: Add menu bar
        setupMenuBar()
        setupNavBarButtons()
    }
    
    // MARK: My Methods
    
    let menuBar: MenuBar = {
        let menubar = MenuBar()
        return menubar
    }()
    
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
    
    func handleSearch(){
        print("search")
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
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
    
    func fetchVideos() {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
            self.videos = videos
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: Collection View Events
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return videos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        
        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        // Here we are calculating the correct aspect ration for the height item
        // Width of the view, minus the 16 pixel spaces on each side, times 9/16
        let height = (view.frame.width - 16 - 16) * 9/16
        
        // Then we add to the height the 16 pixels at the top, plus all the values in the vertical constraints we added
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



