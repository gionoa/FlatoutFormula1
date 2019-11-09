//
//  Publisher .swift
//  Formula 1
//
//  Created by Gio on 11/1/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import Combine
import UIKit

enum WebService {
    private static func dataTask(_ url: URL) -> AnyPublisher<Data, Error> {
        return
            URLSession.shared
                .dataTaskPublisher(for: url)
                .tryMap { data, response in
                    guard
                        let httpResponse = response as? HTTPURLResponse,
                        200..<300 ~= httpResponse.statusCode
                        else {
                            throw PublisherError.network
                    }
                    return data
                }
                .eraseToAnyPublisher()
    }
    
    static func fetch<T: Decodable>(_ subPath: Path) -> AnyPublisher<T, PublisherError> {
        let url = Endpoint(subPath).url!
        
        return
            dataTask(url)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { _ in return PublisherError.parsing }
                .eraseToAnyPublisher()
    }
    
    static func fetchImage(urlString: String) -> AnyPublisher<UIImage, Error> {
        let url = URL(string: urlString)
           
        return
            URLSession.shared.dataTaskPublisher(for: url!)
                .tryMap { data, response in
                    guard let image = UIImage(data: data) else {
                        throw PublisherError.parsing
                    }
                    return image
                }
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
       }
}
