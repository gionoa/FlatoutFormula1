//
//  ConstructorsCollectionView.swift
//  Formula 1
//
//  Created by Gio on 11/12/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

class ConstructorsCollectionView: UICollectionView {
    required init() {
        let layout = ConstructorsFlowLayout()
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(ConstructorCollectionViewCell.self,
                 forCellWithReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier)

        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare() {
        alwaysBounceVertical = true
        backgroundColor = .systemBackground
    }
}
