//
//  URLBuilder.swift
//  Formula 1
//
//  Created by Gio on 11/3/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

// MARK: - Path
enum Path: String {
    case circuits = "/current/circuits.json"
    case constructorStandings = "/current/constructorStandings.json"
    case drivers = "/current/driverStandings.json"
    case driverStandings = "/driverStandings"
    case results = "/results"
    case raceStandings = "/current/results.json"
    case seasons = "/seasons.json"
}

// MARK: - Endpoint
struct Endpoint {
    private (set) var path = "/api/f1"
    
    init(_ subPath: Path) {
        print(subPath.rawValue)
        path.append(subPath.rawValue)
    }
}

// MARK: - Path url
extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ergast.com"
        components.path = path
        return components.url
    }
}
