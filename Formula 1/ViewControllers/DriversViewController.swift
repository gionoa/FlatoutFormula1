//
//  DriversTableView.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Drivers View Controller
#warning("Implement pull to refresh")
final class DriversViewController: UIViewController {
    // MARK: - Properties
    private lazy var viewModel: DriversViewModel = {
        let viewModel = DriversViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: init
    required init() {
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(DriverKitCell.self,
                           forCellReuseIdentifier: DriverKitCell.reuseIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        setupUI()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        #warning("TODO: Handle Localized string")
        navigationItem.title = "Drivers"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Table View Delegate / DataSource
extension DriversViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.numberOfDrivers }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let driver = viewModel.driver(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverKitCell.reuseIdentifier,
                                                 for: indexPath)
            as! DriverKitCell
        
        cell.configure(driver)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DriversViewController {
    func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
