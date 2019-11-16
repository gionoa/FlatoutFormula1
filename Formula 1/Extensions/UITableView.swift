//
//  UITableView.swift
//  Formula 1
//
//  Created by Gio on 11/16/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

// MARK: Table View extension
extension UITableView {
    func registerCell(_ cellClass: UITableViewCell.Type) {
        let reuseIdentifier = cellClass.reuseIdentifier
        register(cellClass, forCellReuseIdentifier: reuseIdentifier)
    }
}
