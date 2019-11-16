//
//  RootTabBarController.swift
//  Formula 1
//
//  Created by Gio on 11/11/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

// MARK: - F1 Navigation Controller
private final class F1NavController: UINavigationController {
    //MARK: - init
    required init(rootViewController: UIViewController, titled title: String) {
        super.init(rootViewController: rootViewController)
        self.title = title
        navigationBar.prefersLargeTitles = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Tab Bar Controller
final class RootTabBarController: UITabBarController {
    // MARK: - Properties
    #warning("TODO: Handle Localized string")
    private let driversNavController = F1NavController(rootViewController: DriversViewController(),
                                                       titled: "Drivers")
    
    #warning("TODO: Handle Localized string")
    private let constructorsNavController = F1NavController(rootViewController: ConstructorsViewController(),
                                                            titled: "Constructors")
    
    #warning("TODO: Handle Localized string")
    private let circuitsNavController = F1NavController(rootViewController: CircuitsViewController(),
                                                        titled: "Circuits")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        #warning("TODO: Implement navigation")
        viewControllers = [driversNavController, constructorsNavController, circuitsNavController]
    }
}
