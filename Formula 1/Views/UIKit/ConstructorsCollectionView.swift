//
//  ConstructorsCollectionView.swift
//  Formula 1
//
//  Created by Gio on 11/12/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

// MARK: - Constructors Flow Layout
class ConstructorsFlowLayout: UICollectionViewFlowLayout {
    // MARK: - Lifecycle
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        itemSize = CGSize(width: collectionView.bounds.inset(by: collectionView.layoutMargins).size.width,
                          height: 150.0)
        
        sectionInset = UIEdgeInsets(top: minimumLineSpacing, left: 0, bottom: 0, right: 0)
        sectionInsetReference = .fromSafeArea
        scrollDirection = .vertical
    }
}

// MARK: - Constructors Collection View
final class ConstructorsCollectionView: UICollectionView {
    // MARK: - Lifecycle
    required init() {
        let layout = ConstructorsFlowLayout()
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        registerCell(ConstructorKitCell.self)
        
        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions
extension ConstructorsCollectionView {
    func prepare() {
         alwaysBounceVertical = true
         backgroundColor = .systemBackground
     }
}
