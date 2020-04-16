//
//  RootTabBarController.swift
//  Formula 1
//
//  Created by Gio on 11/11/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - F1 Navigation Controller
private final class F1NavController: UINavigationController {
    //MARK: - init
    required init(rootViewController: UIViewController, titled title: String) {
        super.init(rootViewController: rootViewController)
        
        rootViewController.title = title
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
    
    
    #warning("TODO: Handle Localized string") 
       private let raceStandingsNavController = F1NavController(rootViewController: RaceStandingsViewController(),
                                                           titled: "GP Results")
    
    #warning("TODO: Handle Localized string")
    private let settingsNavController = F1NavController(rootViewController: UIHostingController(rootView: SettingsView()),
                                                        titled: "Settings")
       
    // MARK: - Lifecycle
    override func viewDidLoad() {
        #warning("TODO: Implement navigation")
        viewControllers = [driversNavController, constructorsNavController, circuitsNavController, raceStandingsNavController]
    }
}


