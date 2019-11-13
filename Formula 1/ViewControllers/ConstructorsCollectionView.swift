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
        layout.itemSize = CGSize(width: 200, height: 200)
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        
        register(ConstructorCollectionViewCell.self,
        forCellWithReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier)
        
        alwaysBounceVertical = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
