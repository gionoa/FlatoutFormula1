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
    override func viewDidLoad() {
        let driversNavController = UINavigationController(rootViewController: DriversTableViewController())
        driversNavController.tabBarItem.title = "Drivers"
        driversNavController.navigationBar.prefersLargeTitles = true
        
        let constructorsNavController =  UINavigationController(rootViewController: ConstructorsCollectionViewController())
        constructorsNavController.tabBarItem.title = "Constructors"
        constructorsNavController.navigationBar.prefersLargeTitles = true

        
        let circuitsNavController =  UINavigationController(rootViewController: CircuitsViewController())
        circuitsNavController.tabBarItem.title = "Circuits"
        
        #warning("TODO: Implement navigation")
        viewControllers = [driversNavController, constructorsNavController, circuitsNavController]
    }
}
