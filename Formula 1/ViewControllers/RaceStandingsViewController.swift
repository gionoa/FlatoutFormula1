//
//  RaceStandingsViewController.swift
//  Formula 1
//
//  Created by Gio on 11/17/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import Combine
import SwiftUI

final class RaceStandingsViewController: UIViewController {
    @ObservedObject var viewModel = RaceStandingsViewModel()
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
