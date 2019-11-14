//
//  CircuitsViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

class CircuitsViewModel: ObservableObject {
    @Published private var circuits = [Circuit]()
    
     weak var delegate: Fetchable?
    
    var numberOfCircuits: Int { circuits.count }
    
    init() {
           fetch()
       }
       
    private func fetch() {
        WebService.fetch(.circuits)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.description)
                }
            }, receiveValue: { (response: Circuits) in
                self.circuits = response.mrData.circuitTable.circuits
                self.delegate?.didFinishFetching()
            })
    }
    
    func circuit(at index: Int) -> Circuit? {
        guard index >= 0 && index < circuits.count else { return nil }
        return circuits[index]
    }
}

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
