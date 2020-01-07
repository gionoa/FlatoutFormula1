//
//  ConstructorsViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/8/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import Combine

// MARK: - Constructors View Model
class ConstructorsViewModel: ObservableObject {
    // MARK: - Properties
    // using @Published for when implementing with SwiftUI
    @Published private var constructors = [ConstructorStanding]()
    
    private var cancellable: AnyCancellable?
    
    var numberOfConstructors: Int { constructors.count }
    
    weak var delegate: Fetchable?
    
    // MARK: - init
    init() {
        fetch()
    }
}

// MARK: - Functions
extension ConstructorsViewModel {
    private func fetch() {
        cancellable =
            WebService
                .fetch(.constructorStandings)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                    }
                }, receiveValue: { (response: Constructors) in
                    let standingsList = response.mrData.standingsTable.standingsLists
                    self.constructors = standingsList.first?.constructorStandings ?? []
                    
                    self.delegate?.didFinishFetching()
                })
    }
    
    func constructor(at index: Int) -> ConstructorStanding { constructors[index] }
}

// MARK: - Private Codable structs
private struct Constructors: Codable {
    let mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct MRData: Codable {
    let standingsTable: StandingsTable

    enum CodingKeys: String, CodingKey {
        case standingsTable = "StandingsTable"
    }
}

struct StandingsTable: Codable {
    let standingsLists: [StandingsList]

    enum CodingKeys: String, CodingKey {
        case standingsLists = "StandingsLists"
    }
}

struct StandingsList: Codable {
    let season, round: String
    let constructorStandings: [ConstructorStanding]

    enum CodingKeys: String, CodingKey {
        case season, round
        case constructorStandings = "ConstructorStandings"
    }
}
