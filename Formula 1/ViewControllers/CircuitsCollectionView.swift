//
//  CircuitsCollectionView.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

final class ConstructorsFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        itemSize = CGSize(width: collectionView.bounds.inset(by: collectionView.layoutMargins).size.width,
                          height: 75.0)
        
        sectionInset = UIEdgeInsets(top: minimumLineSpacing, left: 0, bottom: 0, right: 0)
        sectionInsetReference = .fromSafeArea
        scrollDirection = .vertical
    }
}

final class CircuitsCollectionView: UICollectionView {
    required init() {
        let layout = ConstructorsFlowLayout()
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .systemBackground
        register(CircuitCell.self, forCellWithReuseIdentifier: CircuitCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
