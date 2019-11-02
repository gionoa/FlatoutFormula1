//
//  Publisher .swift
//  Formula 1
//
//  Created by Gio on 11/1/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import Combine

enum PublisherNetworkError: Error, CustomStringConvertible {
    case parsing
    
    var description: String {
        switch self {
            case .parsing: return "Failed to decode from server"
        }
    }
}

//    func dataTask<T: Decodable>(for url: String) -> AnyPublisher<T, Error> {
//        let url = URL(string: url)!
//
//        return URLSession.shared
//            .dataTaskPublisher(for: url)
//            .eraseToAnyPublisher()
//    }
//    func dataTask(_ codableType: Codable, forUrl urlString: String) -> AnyPublisher<codableTypez, Error> {
//        let url = URL(string: urlString)!
//
//        return URLSession.shared
//            .dataTaskPublisher(for: url)
//            .tryMap { data, response -> T in
//                return try JSONDecoder().decode(T.self, from: data)}
////            .catch { error -> Just<Error> in
////                return Just<Error>(error)
////        }
//
//            .eraseToAnyPublisher()
//    }
//}
    
//            .map { $0.data }
//            .decode(type: T.self, decoder: JSONDecoder())
//            .catch { error -> Just<Error> in
//                return Just(PublisherNetworkError.parsing)
//            }
        
        
//            .tryMap { (data, error) in
//                try JSONDecoder().decode(T.self, from: data) }
//            .catch { error in Just<Error>(error).setFailureType(to: Error.self) }
//
//            .eraseToAnyPublisher()
 //}
            
            //.receive(on: RunLoop.main)
        
    
    //            .tryMap { (data, error) in
    //
    //                guard let data = data else { return Just(error) }
    //
    //                try  JSONDecoder().decode(T, from: data)
    //        }
//        return URLSession.shared.dataTaskPublisher(for: url) {
//            .tryMap { (data, _) -> T in
//                try JSONDecoder().decode(T, from: data)
//            }
//
//        }

