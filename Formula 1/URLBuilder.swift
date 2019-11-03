//
//  URLBuilder.swift
//  Formula 1
//
//  Created by Gio on 11/3/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

struct Endpoint {
    private (set) var path = "/api/f1/"
    
    init(forSeason season: Season = .current, category: Category, driver: Driver) {
        self.path += season.rawValue + category.rawValue + driver.rawValue
    }
}

extension Endpoint {
    
    enum Season: String {
        case current = "current/"
    }
    
    enum Category: String {
        case drivers = "drivers/"
    }
    
    enum Driver: String {
        case ricciardo = "ricciardo.json"
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ergast.com"
        components.path = path
        return components.url
    }
}

//endpoint.url(forSeason: .current, )
