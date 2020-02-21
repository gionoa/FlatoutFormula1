//
//  SelectYearViewModel.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/17/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import Combine

class SelectYearViewModel: ObservableObject {
    @Published var dataSource = [Season]() {
        didSet {
            self.delegate?.didFinishFetching()
        }
    }
    
    weak var delegate: Fetchable?
    
    var cancellable: AnyCancellable?
    
    var count: Int { dataSource.count }
    
    var numberOfSections: Int { 1 }
    
    init() {
        fetchData()
    }
}

extension SelectYearViewModel {
    func fetchData() {
        cancellable =
            WebService
                .fetch(.seasons)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print()
                    case .failure(let error):
                        print(error)
                    }
                }, receiveValue: { (years: Year) in
                    self.dataSource = years.mrData.seasonTable.seasons
                    self.delegate?.didFinishFetching()
                })
    }
    
    func item(at index: Int) -> Season? {
        dataSource[index]
    }
}
