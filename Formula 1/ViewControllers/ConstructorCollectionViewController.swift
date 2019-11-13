//
//  ConstructorCollectionViewController.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
import SwiftUI

class ConstructorsCollectionViewController: UIViewController {
    @ObservedObject var viewModel = ConstructorsViewModel()

    var collectionView = ConstructorsCollectionView()
    
    override func viewDidLoad() {
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Constructors"
      
        addSubviews()
        activateConstraints()
    
        enableDelegates()
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

extension ConstructorsCollectionViewController {
    private func addSubviews() {
          view.addSubview(collectionView)
      }
      
      private func activateConstraints() {
          collectionView.translatesAutoresizingMaskIntoConstraints = false

          NSLayoutConstraint.activate([
              collectionView.topAnchor.constraint(equalTo: view.topAnchor),
              collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])
      }
      
      private func enableDelegates() {
          viewModel.delegate = self
          
          collectionView.delegate = self
          collectionView.dataSource = self
      }
}

extension ConstructorsCollectionViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

