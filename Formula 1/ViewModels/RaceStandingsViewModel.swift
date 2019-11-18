//
//  RaceStandingsViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/17/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class RaceStandingsViewModel: ObservableObject {
    @Published var standings = [Race]()
       
    
     init() {
        fetch()
    }
}

extension RaceStandingsViewModel {
    func fetch() {
        WebService.fetch(.raceStandings)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { (result: RaceStandings) in
                self.standings = result.mrData.raceTable.races
            })
    }
}

struct RaceStandings: Codable {
    let mrData: RaceData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct RaceData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: RaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

struct RaceTable: Codable {
    let season: String
    let races: [Race]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

struct Race: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: CircuitData
    let date, time: String
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case results = "Results"
    }
}

struct CircuitData: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct Location: Codable {
    let lat, long, locality, country: String
}

struct Result: Codable {
    let number, position, positionText, points: String
    let driver: Driverr
    let constructor: Constructor
    let grid, laps, status: String
    let time: ResultTime?
    let fastestLap: FastestLap

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

struct Constructor: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

struct Driverr: Codable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

struct FastestLap: Codable {
    let rank, lap: String
    let time: FastestLapTime
    let averageSpeed: AverageSpeed

    enum CodingKeys: String, CodingKey {
        case rank, lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

struct AverageSpeed: Codable {
    let units: Units
    let speed: String
}

enum Units: String, Codable {
    case kph = "kph"
}

struct FastestLapTime: Codable {
    let time: String
}

struct ResultTime: Codable {
    let millis, time: String
}
