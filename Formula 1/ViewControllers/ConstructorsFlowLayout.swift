//
//  ConstructorsFlowLayout.swift
//  Formula 1
//
//  Created by Gio on 11/11/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

class ConstructorsFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        setup()
    }
    
    func setup() {
        guard let collectionView = collectionView else { return }
        
        itemSize = CGSize(width: collectionView.bounds.inset(by: collectionView.layoutMargins).size.width,
                          height: 70.0)
        
        sectionInset = UIEdgeInsets(top: minimumLineSpacing, left: 0, bottom: 0, right: 0)
        sectionInsetReference = .fromSafeArea
        scrollDirection = .vertical
    }
}
