//
//  RootTabBarController.swift
//  Formula 1
//
//  Created by Gio on 11/11/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

final class RootTabBarController: UITabBarController {
    private let driversNavController: UINavigationController = {
        let navController = UINavigationController(
            rootViewController: DriversTableViewController())
        
        #warning("TODO: Handle Localized string")
        navController.tabBarItem.title = "Drivers"
        
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }()
    
    private let constructorsNavController: UINavigationController = {
        let navController = UINavigationController(
            rootViewController: ConstructorsViewController())
        
        #warning("TODO: Handle Localized string")
        navController.tabBarItem.title = "Drivers"
        
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }()
    
    private let circuitsNavController: UINavigationController = {
        let navController = UINavigationController(
            rootViewController: CircuitsViewController())
        
        #warning("TODO: Handle Localized string")
        navController.tabBarItem.title = "Drivers"
        
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }()
    
    override func viewDidLoad() {
        #warning("TODO: Implement navigation")
        viewControllers = [driversNavController, constructorsNavController, circuitsNavController]
    }
}
