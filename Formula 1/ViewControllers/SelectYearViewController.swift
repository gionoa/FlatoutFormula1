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

class SelectYearViewController: UIViewController {
    lazy var viewModel: SelectYearViewModel = {
        let viewModel = SelectYearViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(cancelButtonTapped(_:)))

        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    func setupUI() {
        title = "Select Season"
        navigationController?.navigationBar.prefersLargeTitles = false
        
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

extension SelectYearViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(">>>>>>>>>>", viewModel.count)
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if viewModel.dataSource.isEmpty == false {
            cell.textLabel?.text = viewModel.dataSource[indexPath.row].season
        }
        
        return cell
    }
}

extension SelectYearViewController: Fetchable {
    func didFinishFetching() {
        tableView.reloadSections(IndexSet([0]), with: .automatic)
    }
}

struct Year: Codable {
    let mrData: YearData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct YearData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let seasonTable: SeasonTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case seasonTable = "SeasonTable"
    }
}

struct SeasonTable: Codable {
    let seasons: [Season]

    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

struct Season: Codable {
    let season: String
    let url: String
}
