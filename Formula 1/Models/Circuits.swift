//
//  Circuits.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

struct Circuits: Codable {
    let mrData: CircuitData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct CircuitData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let circuitTable: CircuitTable

    enum CodingKeys: String, CodingKey {
        case xmlns = "xmlns"
        case series = "series"
        case url = "url"
        case limit = "limit"
        case offset = "offset"
        case total = "total"
        case circuitTable = "CircuitTable"
    }
}

struct CircuitTable: Codable {
    let season: String
    let circuits: [Circuit]

    enum CodingKeys: String, CodingKey {
        case season = "season"
        case circuits = "Circuits"
    }
}

struct Circuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url = "url"
        case circuitName = "circuitName"
        case location = "Location"
    }
}

struct Location: Codable {
    let lat: String
    let long: String
    let locality: String
    let country: String

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case long = "long"
        case locality = "locality"
        case country = "country"
    }
}
