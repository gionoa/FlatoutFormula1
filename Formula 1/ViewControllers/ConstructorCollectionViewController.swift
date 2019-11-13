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

class ConstructorsCollectionViewController: UIViewController {
    @ObservedObject var viewModel = ConstructorsViewModel()

    var constructorsCollectionView = ConstructorsCollectionView()
    
    override func viewDidLoad() {
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Constructors"
      
        addSubviews()
        activateConstraints()
        
        viewModel.delegate = self
        
        constructorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        constructorsCollectionView.delegate = self
        constructorsCollectionView.dataSource = self
        
        }
    
    func addSubviews() {
        view.addSubview(constructorsCollectionView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            constructorsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            constructorsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            constructorsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            constructorsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ConstructorsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.constructors.count)
        return viewModel.constructors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let constructor = viewModel.constructors[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier,
                                                      for: indexPath) as! ConstructorCollectionViewCell
        cell.configure(constructor)
        return cell
    }
}
    
extension ConstructorsCollectionView {//UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100,//300 - (8 * 8),//CGSize(width: (collectionView.bounds.width / (2)) - 16,
            height: 300)//collectionViewLayout.collectionViewContentSize.height)// collectionView.frame.width / 1.5)
    }
}

extension ConstructorsCollectionViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.constructorsCollectionView.reloadData()
        }
    }
}

