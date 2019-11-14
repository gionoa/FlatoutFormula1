//
//  TracksViewController.swift
//  Formula 1
//
//  Created by Gio on 11/12/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class CircuitsViewController: UIViewController {
    @ObservedObject var viewModel = CircuitsViewModel()
    
    var collectionView = CircuitsCollectionView()
    
    override func viewDidLoad() {
        title = "Circuits"
        
        addSubviews()
        activateConstraints()
        
        enableDelegates()
    }
    
    func addSubviews() {
        view.addSubview(collectionView)
    }
    
    func activateConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func enableDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.delegate = self
    }
}

extension CircuitsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { viewModel.numberOfCircuits }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let circuit = viewModel.circuit(at: indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircuitCell.reuseIdentifier, for: indexPath) as! CircuitCell
        cell.configure(circuit)
        return cell
    }
}

extension CircuitsViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
