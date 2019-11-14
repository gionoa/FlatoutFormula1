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
        
        let secondVC =  UINavigationController(rootViewController: ConstructorsCollectionViewController(nibName: nil, bundle: nil))
        secondVC.tabBarItem.title = "Constructors"
        
        let thirdVC =  UINavigationController(rootViewController: CircuitsViewController())
        thirdVC.tabBarItem.title = "Circuits"
        
        #warning("TODO: Implement navigation")
        viewControllers = [firstVC, secondVC, thirdVC]
    }
}
