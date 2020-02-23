//
//  SelectYearViewModel.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/17/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import Combine

class SelectYearViewModel {
    static var yearValueSubject = CurrentValueSubject<Int, Never>(2019)
    
    @Published var dataSource = [Season]()
    
    weak var delegate: Fetchable?
    
    var cancellable: AnyCancellable?
    
    var count: Int { dataSource.count }
    
    var numberOfSections: Int { 1 }
    
    init() {
        fetchData()
    }
}

extension SelectYearViewModel {
    private func fetchData() {
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
        guard index < dataSource.count else { return nil }
        return dataSource[index]
    }
    
    func updateCurrentValue(for year: Int) {
           SelectYearViewModel.yearValueSubject.value = year
    }
}
