//
//  CircuitsCollectionView.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

// MARK: - Circuits Flow Layout
private final class CircuitsFlowLayout: ConstructorsFlowLayout {
    // MARK: - init
    override required init() {
        super.init()
    }
    
    // MARK: - Lifecycle
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

// MARK: - Circuits Collection View
final class CircuitsCollectionView: UICollectionView {
    // MARK: - init
    required init() {
        let layout = CircuitsFlowLayout()

        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .systemBackground
        registerCell(CircuitCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
