//
//  DriversTableView.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - DriversTableView
#warning("Implement pull to refresh")
final class DriversViewController: UITableViewController {
    private lazy var viewModel: DriversViewModel = {
        let viewModel = DriversViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    required init() {
        super.init(style: .plain)
        
        tableView.register(DriverKitCell.self,
                           forCellReuseIdentifier: DriverKitCell.reuseIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        #warning("TODO: Handle Localized string")
        navigationItem.title = "Drivers"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DriversViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.numberOfDrivers }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let driver = viewModel.driver(at: indexPath.row)
                
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverKitCell.reuseIdentifier,
                                                 for: indexPath)
                                                 as! DriverKitCell
        
        cell.configure(driver)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Fetchable
extension DriversViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
