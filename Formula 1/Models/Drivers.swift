//
//  Drivers.swift
//  Formula 1
//
//  Created by Gio on 11/3/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

struct Drivers: Codable {
    let MRData: MRData
    
    internal struct MRData: Codable {
        let DriverTable: DriverTable
    }
    
    internal struct DriverTable: Codable {
        let Drivers: [Driver]
    }
}

struct Driver: Codable {
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
