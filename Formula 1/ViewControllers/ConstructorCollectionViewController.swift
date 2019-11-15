//
//  ConstructorCollectionViewController.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
import SwiftUI

final class ConstructorsCollectionViewController: UIViewController {
    private lazy var viewModel: ConstructorsViewModel = {
        let viewModel = ConstructorsViewModel()
        viewModel.delegate = self
        return viewModel
    }()

    private lazy var collectionView: ConstructorsCollectionView = {
        let collectionView = ConstructorsCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Constructors"
      
        setupUI()
    }
}

extension ConstructorsCollectionViewController {
    private func setupUI() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ConstructorsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfConstructors
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let constructor = viewModel.constructor(at: indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstructorCollectionViewCell.reuseIdentifier,
                                                      for: indexPath) as! ConstructorCollectionViewCell
        cell.configure(constructor)
        return cell
    }
}

extension ConstructorsCollectionViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            let section = IndexSet([0])
            self.collectionView.reloadSections(section)
        }
    }
}

