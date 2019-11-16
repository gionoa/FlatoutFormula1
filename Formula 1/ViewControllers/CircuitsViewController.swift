//
//  CircuitsViewController.swift
//  Formula 1
//
//  Created by Gio on 11/12/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
  
// MARK: - Circuits View Controller
final class CircuitsViewController: UIViewController {
    // MARK: - Properties
    private lazy var viewModel: CircuitsViewModel = {
        let viewModel = CircuitsViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private lazy var collectionView: CircuitsCollectionView = {
        let collectionView = CircuitsCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Functions
extension CircuitsViewController {
    func setupUI() {
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
extension CircuitsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCircuits
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let circuit = viewModel.circuit(at: indexPath.row) else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircuitCell.reuseIdentifier, for: indexPath) as! CircuitCell
        cell.configure(with: circuit)
        return cell
    }
}

// MARK: - Fetchable
extension CircuitsViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            let section = IndexSet([0])
            self.collectionView.reloadSections(section)
        }
    }
}
