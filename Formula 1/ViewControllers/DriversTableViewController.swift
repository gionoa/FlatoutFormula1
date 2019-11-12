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
class DriversTableViewController: UITableViewController {
    @ObservedObject var viewModel = DriversViewModel()

    override init(style: UITableView.Style) {
        super.init(style: style)
        
        tableView.register(DriverKitCell.self,
                           forCellReuseIdentifier: DriverKitCell.reuseIdentifier)
        
        viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
       // navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.title = "Drivers"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 44 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.numberOfDrivers }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let driver = viewModel.driver(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverKitCell.reuseIdentifier,
                                                 for: indexPath)
                                                 as! DriverKitCell
        
        cell.configure(firstName: driver.givenName, lastName: driver.familyName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Fetchable
extension DriversTableViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
