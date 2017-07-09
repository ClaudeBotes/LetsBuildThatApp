//
//  SettingsLauncher.swift
//  YouTubeClone
//
//  Created by Claude on 9/7/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    
    override init() {
        super.init()
        // start doing something
    }
    
    // blackView is used to dim the bacckground when showing a menu or performing search
    let blackView = UIView()
    
    let menuHeight = 200
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    /**
     Handle for when a user clicks on the more button
     */
    func showSettings(){
        
        // Set the background to black with opacity
        if let window = UIApplication.shared.keyWindow{
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            // Add gesture recognizer to dismiss view
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let y = Int(window.frame.height) - menuHeight
            collectionView.frame = CGRect(x: 0, y: Int(window.frame.height), width: Int(window.frame.width), height: menuHeight)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                
                self.blackView.alpha = 1
                
                // animate slide up of menu
                self.collectionView.frame = CGRect(x: 0, y: y, width: Int(self.collectionView.frame.width), height: Int(self.collectionView.frame.height))
                
            }, completion: nil)
        
        }
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow{
                self.collectionView.frame = CGRect(x: 0, y: Int(window.frame.height), width: Int(window.frame.width), height: self.menuHeight)
            }
            
            
            
        }
    }
}
