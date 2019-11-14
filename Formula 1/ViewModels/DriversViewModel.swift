//
//  ViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/2/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import Combine

class DriversViewModel: ObservableObject {
    var numberOfDrivers: Int { drivers.count }
    var driversArray: [DriverStanding] { drivers }
    
    weak var delegate: Fetchable?

    @Published private var drivers = [DriverStanding]()
    
    init() {
        fetch()
    }
    
    func driver(at index: Int) -> DriverStanding { driversArray[index] }
    
    private func fetch() {
        WebService.fetch(.drivers)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { (response: DriverStandings) in
                print(response)
                self.drivers = response.driverData.driverStandingsTable.standingsLists[0].driverStandings
                self.delegate?.didFinishFetching()
            })
    }
}
