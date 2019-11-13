//
//  CircuitsCollectionView.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

class CircuitsCollectionView: UICollectionView {
    required init() {
        let layout = ConstructorsFlowLayout()
        
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        
        backgroundColor = .white
        register(CircuitCell.self, forCellWithReuseIdentifier: CircuitCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
