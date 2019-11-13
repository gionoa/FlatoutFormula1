//
//  URLBuilder.swift
//  Formula 1
//
//  Created by Gio on 11/3/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

enum Path: String {
    case circuits = "/current/circuits.json"
    case constructorStandings = "/current/constructorStandings.json"
    case drivers = "/current/driverStandings.json"
    case driverStandings = "/driverStandings"
    case results = "/results"
}

struct Endpoint {
    private (set) var path = "/api/f1"
    
    init(_ subPath: Path) {
        path.append(subPath.rawValue)
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ergast.com"
        components.path = path
        return components.url
    }
}
