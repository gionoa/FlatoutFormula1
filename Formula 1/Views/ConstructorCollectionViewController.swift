//
//  ConstructorCollectionViewController.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

class ConstructorCollectionViewController: UICollectionViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        super.init(collectionViewLayout: flowLayout)
    }
    
    override func viewDidLoad() {
        collectionView.register(ConstructorCollectionViewCell.self, forCellWithReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier, for: indexPath) as! ConstructorCollectionViewCell
        
        cell.configure(title: "Mercedes")
        return cell
    }
}

extension ConstructorCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / (2.15), height: collectionView.frame.width / 3) // no me gusta esto
    }
}
