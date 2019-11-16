//
//  CircuitsCollectionView.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

private final class CircuitsFlowLayout: ConstructorsFlowLayout {
    override required init() {
        super.init()
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        itemSize = CGSize(width: collectionView.bounds.inset(by: collectionView.layoutMargins).size.width,
                          height: 75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class CircuitsCollectionView: UICollectionView {
    required init() {
        let layout = CircuitsFlowLayout()

        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .systemBackground
        register(CircuitCell.self, forCellWithReuseIdentifier: CircuitCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
