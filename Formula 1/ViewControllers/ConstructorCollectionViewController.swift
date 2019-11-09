//
//  ConstructorCollectionViewController.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class ConstructorsCollectionViewController: UICollectionViewController {
    @ObservedObject var viewModel = ConstructorsViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let flowLayout = UICollectionViewFlowLayout()
                
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        
        super.init(collectionViewLayout: flowLayout)
    }
    
    override func viewDidLoad() {
        collectionView.register(ConstructorCollectionViewCell.self,
                                forCellWithReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier)
        
       collectionView.backgroundColor = .white
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.constructors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let constructor = viewModel.constructors[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier,
                                                      for: indexPath) as! ConstructorCollectionViewCell
        cell.configure(constructor)
        return cell
    }
}

extension ConstructorsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.8,//CGSize(width: (collectionView.bounds.width / (2)) - 16,
            height: collectionView.frame.width / 1.5)
    }
}

extension ConstructorsCollectionViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
