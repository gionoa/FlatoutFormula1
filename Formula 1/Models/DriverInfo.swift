//
//  DriverInfo.swift
//  Formula 1
//
//  Created by Gio on 11/2/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

struct DriverInfo: Codable {
    let data: MRData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
    
    struct MRData: Codable {
        let driverTable: DriverTable

        enum CodingKeys: String, CodingKey {
            case driverTable = "DriverTable"
        }
    }
    
    struct DriverTable: Codable {
        let season, driverID: String
        let drivers: [Driver]

        enum CodingKeys: String, CodingKey {
            case season
            case driverID = "driverId"
            case drivers = "Drivers"
        }
    }

    struct Driver: Codable {
        let driverID: String
        let carNumber: String
        let driverTicker: String
        
        let firstName: String
        let lastName: String
        let birthDate: String
        let nationality: String

        enum CodingKeys: String, CodingKey {
            case driverID = "driverId"
            case carNumber = "permanentNumber"
            case driverTicker = "code"
            case firstName = "givenName"
            case lastName = "familyName"
            case birthDate = "dateOfBirth"
            case nationality
        }
    }
}
