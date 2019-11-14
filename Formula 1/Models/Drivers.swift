//
//  Drivers.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

 struct DriverStandings: Codable {
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

struct Driver: Codable, Identifiable {
    let id = UUID()
    let driverID: String
    let permanentNumber: String
    let code: String
    let url: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber = "permanentNumber"
        case code = "code"
        case url = "url"
        case givenName = "givenName"
        case familyName = "familyName"
        case dateOfBirth = "dateOfBirth"
        case nationality = "nationality"
    }
}
