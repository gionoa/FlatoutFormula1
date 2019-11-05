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
        
        viewModel.fetch {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.drivers.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let driver = viewModel.drivers[indexPath.row]
        let driver = Driver(permanentNumber: "1", code: "1", givenName: "1", familyName: "1", dateOfBirth: "1", nationality: "1")
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverKitCell.reuseIdentifier, for: indexPath) as! DriverKitCell
        cell.configure(firstName: "Valtteri", lastName: "Bottas")
        return cell
    }
}

extension DriversViewModel {
    func fetch(_ completion: @escaping () -> Void) {
        fetchPublished()
        completion()
    }
}
