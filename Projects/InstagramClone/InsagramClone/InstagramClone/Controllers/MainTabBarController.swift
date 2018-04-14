//
//  MainTabBarController.swift
//  InstagramClone
//
//  Created by Claude on 1/4/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.index(of: viewController)
        if index == 2 {
            
            return false
        }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        // Transactions
        let transactionsNavController = getNewNavigationController(unselectedImage: #imageLiteral(resourceName: "money-disabled"), selectedImage: #imageLiteral(resourceName: "money-enabled"), rootViewController: TransactionsViewController())
        
        // Home
        let homeNavController = getNewNavigationController(unselectedImage: #imageLiteral(resourceName: "card-disabled"), selectedImage: #imageLiteral(resourceName: "card-enabled"), rootViewController: AccountSummaryViewController())
        
        // User Profile
        
        let userProfileNavController = getNewNavigationController(unselectedImage: #imageLiteral(resourceName: "profile-disabled"), selectedImage: #imageLiteral(resourceName: "profile-enabled"), rootViewController: ContactsViewController())
        
        tabBar.tintColor = ApplicationTheme.Colors.PrimaryColor2()
        
        viewControllers = [homeNavController,
                           transactionsNavController,
                           userProfileNavController]
        
        //modify tab bar item insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
