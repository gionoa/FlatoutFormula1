//
//  CircuitsViewModel.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

class CircuitsViewModel: ObservableObject {
    @Published private var circuits = [Circuit]()
    
     weak var delegate: Fetchable?
    
    var numberOfCircuits: Int { circuits.count }
    
    init() {
           fetch()
       }
       
    private func fetch() {
        WebService.fetch(.circuits)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.description)
                }
            }, receiveValue: { (response: Circuits) in
                self.circuits = response.mrData.circuitTable.circuits
                self.delegate?.didFinishFetching()
            })
    }
    
    func circuit(at index: Int) -> Circuit? {
        guard index >= 0 && index < circuits.count else { return nil }
        return circuits[index]
    }
}
