//
//  CircuitsViewController.swift
//  Formula 1
//
//  Created by Gio on 11/12/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import SwiftUI

final class CircuitsViewController: UIViewController {
    private lazy var viewModel: CircuitsViewModel = {
        let viewModel = CircuitsViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private lazy var collectionView: CircuitsCollectionView = {
        let collectionView = CircuitsCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #warning("TODO: Handle Localize strings")
        title = "Circuits"
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

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

extension CircuitsViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            let section = IndexSet([0])
            self.collectionView.reloadSections(section)
        }
    }
}
