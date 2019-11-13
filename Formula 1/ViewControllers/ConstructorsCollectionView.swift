//
//  ConstructorsCollectionView.swift
//  Formula 1
//
//  Created by Gio on 11/12/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

private class ConstructorsFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let collectionView = collectionView else { return }
               
               itemSize = CGSize(width: collectionView.bounds
                                       .inset(by: collectionView.layoutMargins)
                                       .size.width - 50,
                                 height: 150.0)
               
               sectionInset = UIEdgeInsets(top: minimumLineSpacing,
                                           left: minimumLineSpacing,
                                           bottom: minimumLineSpacing,
                                           right: minimumLineSpacing)
        
               sectionInsetReference = .fromSafeArea
               scrollDirection = .vertical
    }
}

class ConstructorsCollectionView: UICollectionView {
    required init() {
        let layout = ConstructorsFlowLayout()
        
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        
        register(ConstructorCollectionViewCell.self,
                 forCellWithReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier)

        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare() {
        alwaysBounceVertical = true
        backgroundColor = .white
    }
}
