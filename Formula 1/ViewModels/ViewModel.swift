//
//  ViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/2/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import Combine

struct MyType: Decodable {
    
}

class ViewModel: ObservableObject {
    var cancellable: AnyPublisher<MyType, Error>
    
    init() {
        cancellable = cancellable.dataTask(for: "asd").eraseToAnyPublisher()
    }
}
