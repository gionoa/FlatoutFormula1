//
//  Publisher .swift
//  Formula 1
//
//  Created by Gio on 11/1/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import Combine

struct WebService {
    private static func dataTask(_ url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw PublisherError.network
                }
                return data
            }
            .eraseToAnyPublisher()
    }
    
    static func fetch<T: Decodable>(_ subPath: Path) -> AnyPublisher<T, PublisherError> {
        let url = Endpoint(subPath).url!
        print(url)
        return
            dataTask(url)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { _ in return PublisherError.parsing }
                .eraseToAnyPublisher()
    }
}
