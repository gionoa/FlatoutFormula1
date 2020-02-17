//
//  ViewModel.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/16/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import Combine

protocol ViewModel {
    associatedtype DataType
    var dataSource: DataType { get }
    var cancellable: AnyCancellable? { get }
    var count: Int { get }
    
    func fetchData()
}
