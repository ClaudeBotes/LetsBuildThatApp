//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Claude on 28/6/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var videos: [Video] = {
        
        // MARK: Setup Blink channel and vids
        var blink182Channel = Channel()
        blink182Channel.name = "Blink 182"
        blink182Channel.profileImageName = "blinkAvatar"
        
        var firstDate = Video()
        firstDate.title = "Blink 182 - First Date"
        firstDate.thumbnailImageName = "firstDateThumbnail"
        firstDate.numberOfViews = 97988325
        
        firstDate.subTitle = "blink182VEVO • 97,988,325 views • 8 years ago"
        firstDate.channel = blink182Channel
        
        // MARK: Setup Gangnam channel and vids
        
        var psyChannel = Channel()
        psyChannel.name = "PSY"
        psyChannel.profileImageName = "gangumAvatar"
        
        var gangnamStyle = Video()
        gangnamStyle.title = "PSY - GANGNAM STYLE(강남스타일) M/V"
        gangnamStyle.thumbnailImageName = "gangnumThumbnail"
        gangnamStyle.numberOfViews = 17988325
        gangnamStyle.subTitle = "officialpsy • 2.8B views • 4 years ago"
        gangnamStyle.channel = psyChannel
        
        return [gangnamStyle, firstDate]
        
    }()
    
    // MARK: View Controller Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        
        // MARK: Setup home screen label
        
        // * subtracting 32 to have the spacing at the begining of the label
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
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
        
        view.addSubview(menuBar)
        view.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat(format: "V:|[v0(50)]|", views: menuBar)
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
    
    func handleMore(){
        print("more")
    }
    
    // MARK: Collection View Events
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        
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



