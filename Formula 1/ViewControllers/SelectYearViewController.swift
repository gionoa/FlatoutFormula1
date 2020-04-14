//
//  SelectYearViewController.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/16/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import UIKit
import Combine
import SwiftUI

protocol SelectYearDelegate: class {
    func didSelectYear(year: Int)
}

class SelectYearViewController: UIViewController {
    lazy var viewModel: SelectYearViewModel = {
        let viewModel = SelectYearViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    var cancellables = Set<AnyCancellable>()
    
    weak var delegate: SelectYearDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SeasonKitCell.self, forCellReuseIdentifier: SeasonKitCell.reuseID)
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
//                                                            style: .done,
//                                                            target: self,
//                                                            action: #selector(cancelButtonTapped(_:)))
        setupUI()
        
        viewModel.$dataSource
            .sink() { arr in
                self.tableView.reloadSections(IndexSet([0]), with: .automatic)
            }
            .store(in: &cancellables)
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground        
        view.addSubview(tableView)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    @objc func cancelButtonTapped(_ sender: UIBarButtonItem) {
          dismiss(animated: true) 
      }
}

extension SelectYearViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SeasonKitCell.reuseID,
                                                 for: indexPath)
            as! SeasonKitCell
        
        guard let season = viewModel.item(at: indexPath.row) else { fatalError() }

        cell.configure(with: season)
        
        return cell
    }
}

extension SelectYearViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let season = viewModel.item(at: indexPath.row) else { fatalError() }
        guard let year = Int(season.season) else { fatalError() }
        
        SelectYearViewModel.yearValueSubject.value = year
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 44 }
}

extension SelectYearViewController: Fetchable {
    func didFinishFetching() {
        DispatchQueue.main.async {
            self.tableView.reloadSections(IndexSet([0]), with: .automatic)
        }
    }
}
