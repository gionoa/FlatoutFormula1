//
//  RootTabBarController.swift
//  Formula 1
//
//  Created by Gio on 11/11/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

private final class F1NavController: UINavigationController {
    required init(rootViewController: UIViewController, titled title: String) {
        super.init(rootViewController: rootViewController)
        self.title = title
        navigationBar.prefersLargeTitles = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class RootTabBarController: UITabBarController {
    #warning("TODO: Handle Localized string")
    private let driversNavController = F1NavController(rootViewController: DriversViewController(),
                                                       titled: "Drivers")
    
    #warning("TODO: Handle Localized string")
    private let constructorsNavController = F1NavController(rootViewController: ConstructorsViewController(),
                                                            titled: "Constructors")
    
    #warning("TODO: Handle Localized string")
    private let circuitsNavController = F1NavController(rootViewController: DriversViewController(),
                                                        titled: "Circuits")
    override func viewDidLoad() {
        #warning("TODO: Implement navigation")
        viewControllers = [driversNavController, constructorsNavController, circuitsNavController]
    }
}
