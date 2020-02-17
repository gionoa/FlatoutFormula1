//
//  ViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/2/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import Combine

// MARK: - Drivers View Model
class DriversViewModel: ObservableObject, ViewModel {
    var numberOfSections: Int { 1 }
    
    // MARK: ViewModel Properties
    @Published private(set) var dataSource = [DriverStanding]()
    
    var cancellable: AnyCancellable?
    var count: Int { dataSource.count }
   
    // MARK: - Fetchable Delegate
    weak var delegate: Fetchable?

    // MARK: - Lifecycle
    init() {
        fetchData()
    }
    
    func fetchData() {
        cancellable =
            WebService
                .fetch(.drivers)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                    }
                }, receiveValue: { (response: DriverStandings) in
                    self.dataSource = response.driverData.driverStandingsTable.standingsLists.first?.driverStandings ?? []
                    self.delegate?.didFinishFetching()
                })
    }
}

// MARK: - Functions
extension DriversViewModel {
    func driver(at index: Int) -> DriverStanding { dataSource[index] }
}

// MARK: - Private Codable structs
private struct DriverStandings: Codable {
    let driverData: DriverData

    enum CodingKeys: String, CodingKey {
        case driverData = "MRData"
    }
}

 struct DriverData: Codable {
    let driverStandingsTable: DriverStandingsTable

    enum CodingKeys: String, CodingKey {
        case driverStandingsTable = "StandingsTable"
    }
}

 struct DriverStandingsTable: Codable {
    let season: String
    let standingsLists: [DriverStandingsList]

    enum CodingKeys: String, CodingKey {
        case season = "season"
        case standingsLists = "StandingsLists"
    }
}

 struct DriverStandingsList: Codable {
    let season: String
    let round: String
    let driverStandings: [DriverStanding]

    enum CodingKeys: String, CodingKey {
        case season = "season"
        case round = "round"
        case driverStandings = "DriverStandings"
    }
}

 struct DriverStanding: Codable, Identifiable {
    let id = UUID()
    let position: String
    let positionText: String
    let points: String
    let wins: String
    let driver: Driver
    let constructors: [DriverConstructor]

    enum CodingKeys: String, CodingKey {
        case position = "position"
        case positionText = "positionText"
        case points = "points"
        case wins = "wins"
        case driver = "Driver"
        case constructors = "Constructors"
    }
}

 struct DriverConstructor: Codable {
    let constructorID: String
    let url: String
    let name: String
    let nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url = "url"
        case name = "name"
        case nationality = "nationality"
    }
}
