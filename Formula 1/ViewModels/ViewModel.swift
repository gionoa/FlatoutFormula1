//
//  ViewModel.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/16/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import Combine

protocol ViewModel: class {
    associatedtype DataType
    associatedtype SubType
    
    var dataSource: DataType { get }
    var cancellable: AnyCancellable? { get }
    var count: Int { get }
    var numberOfSections: Int { get }
    
    #warning("Find way to have global update of season")
    func fetchData(for year: Int?)
    func item(at index: Int) -> SubType?
}
