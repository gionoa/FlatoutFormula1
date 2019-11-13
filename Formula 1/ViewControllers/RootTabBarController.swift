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
        
        let thirdVC =  UINavigationController(rootViewController: CircuitsCollectionViewController())
        thirdVC.tabBarItem.title = "Circuits"
        
        viewControllers = [firstVC, secondVC, thirdVC]
    }
}
