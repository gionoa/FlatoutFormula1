//
//  RootTabBarController.swift
//  Formula 1
//
//  Created by Gio on 11/11/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

class RootTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        let firstVC = UINavigationController(rootViewController: DriversTableViewController(style: .plain))
        firstVC.tabBarItem.title = "Drivers"
        firstVC.navigationBar.prefersLargeTitles = true
        
        let secondVC =  UINavigationController(rootViewController: ConstructorsCollectionViewController())
        secondVC.tabBarItem.title = "Constructors"
        secondVC.navigationBar.prefersLargeTitles = true

        
        viewControllers = [firstVC, secondVC]
    }
}
