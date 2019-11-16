//
//  PublisherError.swift
//  Formula 1
//
//  Created by Gio on 11/3/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

// MARK: - Publisher Error
enum PublisherError: Error {
    case url
    case network
    case parsing
}

// MARK: - Publisher Description
extension PublisherError: CustomStringConvertible {
    var description: String {
        switch self {
            case .url: return "Failed to build URL"
            case .network: return "Failed to reach server"
            case .parsing: return "Failed to decode from server"
        }
    }
}
