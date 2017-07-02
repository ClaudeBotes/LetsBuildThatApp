//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Claude on 28/6/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
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
    }
    
    // MARK: Collection View 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        // Here we are calculating the correct aspect ration for the height item
        // Width of the view, minus the 16 pixel spaces on each side, times 9/16
        let height = (view.frame.width - 16 - 16) * 9/16
        
        // Then we add to the height the 16 pixels at the top, plus all the values in the vertical constraints we added
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



