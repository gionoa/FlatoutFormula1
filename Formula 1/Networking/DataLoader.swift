//
//  Publisher .swift
//  Formula 1
//
//  Created by Gio on 11/1/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import Combine

enum PublisherError: Error, CustomStringConvertible {
    case network
    case parsing
    
    var description: String {
        switch self {
            case .network: return "Failed to reach server"
            case .parsing: return "Failed to decode from server"
        }
    }
}

struct DataLoader {
    private static func dataTask(_ url: URL) -> AnyPublisher<Data, Error> {
        let endpoint = Endpoint(category: .drivers, driver: .ricciardo).url!
        print(endpoint)
        return URLSession.shared
            .dataTaskPublisher(for: endpoint)//url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw PublisherError.network
                }
                return data
            }
            .eraseToAnyPublisher()
    }
    
    static func fetch<T: Decodable>(url: String) -> AnyPublisher<T, PublisherError> {
        let url = URL(string: url)!
        
        return
            Self.dataTask(url)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                    return PublisherError.parsing
                }
                .eraseToAnyPublisher()
    }
}
