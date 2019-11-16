//
//  ConstructorCollectionViewController.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: Constructors View Controller
final class ConstructorsViewController: UIViewController {
    // Mark: - Properties
    private lazy var viewModel: ConstructorsViewModel = {
        let viewModel = ConstructorsViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private lazy var collectionView: ConstructorsCollectionView = {
        let collectionView = ConstructorsCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        setupUI()
    }
}

// MARK: - Functions
extension ConstructorsViewController {
    private func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - CollectionView Delegate / DataSource
extension ConstructorsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfConstructors
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let constructor = viewModel.constructor(at: indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstructorKitCell.reuseIdentifier,
                                                      for: indexPath) as! ConstructorKitCell
        cell.configure(constructor)
        return cell
    }
}

// MARK: - Fetchable
extension ConstructorsViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            let section = IndexSet([0])
            self.collectionView.reloadSections(section)
        }
    }
}
