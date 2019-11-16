//
//  Circuit.swift
//  Formula 1
//
//  Created by Gio on 11/15/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

// MARK: - Circuit
struct Circuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location
    
    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url
        case circuitName
        case location = "Location"
    }
    
    struct Location: Codable {
        let lat: String
        let long: String
        let locality: String
        let country: String
        
        enum CodingKeys: String, CodingKey {
            case lat
            case long
            case locality
            case country
        }
    }
}
