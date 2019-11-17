//
//  Constructor.swift
//  Formula 1
//
//  Created by Gio on 11/16/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

// MARK: - Constructor struct
struct ConstructorStanding: Codable {
    let position, positionText, points, wins: String
    let constructor: Constructor

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
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
}

