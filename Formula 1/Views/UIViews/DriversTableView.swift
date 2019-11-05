//
//  DriversTableView.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class DriversTableView: UITableViewController {
    @ObservedObject var viewModel = DriversViewModel()
        
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        tableView.register(DriverKitCell.self, forCellReuseIdentifier: DriverKitCell.reuseIdentifier)
        
        viewModel.delegate = self
        viewModel.fetchPublished()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.drivers.count)
        return viewModel.drivers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let driver = viewModel.drivers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverKitCell.reuseIdentifier,
                                                 for: indexPath)
                                                 as! DriverKitCell
        
        cell.configure(firstName: driver.givenName, lastName: driver.familyName)
        return cell
    }
}

extension DriversTableView: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
