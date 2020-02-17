//
//  SelectYearViewController.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/16/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import UIKit

class SelectYearViewController: UIViewController {
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(cancelButtonTapped(_:)))

        view.backgroundColor = .systemBackground
    }
    
    @objc func cancelButtonTapped(_ sender: UIBarButtonItem) {
          dismiss(animated: true) 
      }
}
