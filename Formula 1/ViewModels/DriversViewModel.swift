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

fileprivate struct Drivers: Codable {
    let MRData: MRData
    
    struct MRData: Codable {
        let DriverTable: DriverTable
    }
    
    struct DriverTable: Codable {
        let Drivers: [Driver]
    }
}

struct Driver: Codable, Identifiable {
    let id = UUID()
    let permanentNumber: String
    let code: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String
    
    enum CodingKeys: String, CodingKey {
        case permanentNumber = "permanentNumber"
        case code = "code"
        case givenName = "givenName"
        case familyName = "familyName"
        case dateOfBirth = "dateOfBirth"
        case nationality = "nationality"
    }
}

class DriversViewModel: ObservableObject {
    var numberOfDrivers: Int { drivers.count }
    var driversArray: [Driver] { drivers }
    
    weak var delegate: Fetchable?

    @Published private var drivers = [Driver]()
    
    init() {
        fetch()
    }
    
    func driver(at index: Int) -> Driver { drivers[index] }
    
    private func fetch() {
        WebService.fetch(.drivers)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }, receiveValue: { (response: Drivers) in
                print(">>> ", response)
                self.drivers = response.MRData.DriverTable.Drivers
                self.delegate?.didFinishFetching()
            })
    }
}
