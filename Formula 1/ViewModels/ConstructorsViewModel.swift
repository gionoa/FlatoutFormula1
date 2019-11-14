//
//  ConstructorsViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/8/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

private struct Constructors: Codable {
         let mrData: ConstructorsData

         enum CodingKeys: String, CodingKey {
             case mrData = "MRData"
         }
     }

     struct ConstructorsData: Codable {
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

     struct ConstructorStanding: Codable {
         let position, positionText, points, wins: String
         let constructor: Constructor

         enum CodingKeys: String, CodingKey {
             case position, positionText, points, wins
             case constructor = "Constructor"
         }
     }
     
     struct Constructor: Codable {
         let constructorID: String
         let url: String
         let name: String
         let nationality: String
         
         enum CodingKeys: String, CodingKey {
             case constructorID = "constructorId"
             case url, name, nationality
         }
     }

class ConstructorsViewModel: ObservableObject {
    @Published var constructors = [ConstructorStanding]()
    
    weak var delegate: Fetchable?
    
    init() {
        fetch()
    }
    
    private func fetch() {
        WebService.fetch(.constructorStandings)
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
}

