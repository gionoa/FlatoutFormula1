//
//  CircuitsViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

// MARK: - Circuits View Model
class CircuitsViewModel: ObservableObject {
    // MARK: - Properties
    // using @Published for when implementing with SwiftUI
    @Published private var circuits = [Circuit]()
    
    var numberOfCircuits: Int { circuits.count }
    
    // MARK: - Fetchable Delegate
    weak var delegate: Fetchable?
    
    // MARK: - init
    init() {
        fetch()
    }
}

// MARK: - Functions
extension CircuitsViewModel {
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
        guard index >= circuits.startIndex && index < circuits.endIndex else { return nil }
        return circuits[index]
    }
}

// MARK: - Private Codable structs
private struct Circuits: Codable {
    let mrData: CircuitData
    
    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
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
            case xmlns
            case series
            case url
            case limit
            case offset
            case total
            case circuitTable = "CircuitTable"
        }
    }

    struct CircuitTable: Codable {
        let season: String
        let circuits: [Circuit]
        
        enum CodingKeys: String, CodingKey {
            case season
            case circuits = "Circuits"
        }
    }
}
