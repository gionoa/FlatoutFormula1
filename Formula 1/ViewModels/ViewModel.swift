//
//  ViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/2/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

class ViewModel {
    init() {
        APIService.fetch(url: "https://ergast.com/api/f1/current/drivers/ricciardo.json")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }, receiveValue: { (myType: DriverInfo) in
                print(myType)
            })
    }
}
