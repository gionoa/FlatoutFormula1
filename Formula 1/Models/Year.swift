//
//  Year.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/20/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation

struct Year: Codable {
    let mrData: YearData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct YearData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let seasonTable: SeasonTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case seasonTable = "SeasonTable"
    }
}

struct SeasonTable: Codable {
    let seasons: [Season]

    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

struct Season: Codable {
    let season: String
    let url: String
}
