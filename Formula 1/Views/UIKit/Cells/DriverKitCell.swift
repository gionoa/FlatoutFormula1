//  DriverKitCell.swift
//  Formula 1
//
//  Created by Gio on 11/15/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

// MARK: - Driver Table View Cell
class DriverKitCell: UITableViewCell {
    // MARK: - Properties
    
    private let permanentNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Regular
        return label
    }()
    
    private let constructorColor: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        // set to constructor color
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.Formula1Font.Regular
          return label
      }()
      
    private lazy var pointsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.Formula1Font.Regular
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [constructorColor, nameLabel, permanentNumberLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions
extension DriverKitCell {
    func setupUI() {
        contentView.addSubview(stackView)
        contentView.addSubview(pointsLabel)
        
        let inset: CGFloat = 8

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset * 1.5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset * 2),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            constructorColor.widthAnchor.constraint(equalToConstant: 8),
            constructorColor.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -inset * 2),
            
            pointsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pointsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset)
        ])
    }
    
    func configure(_ driver: DriverStanding) {
        permanentNumberLabel.text = driver.driver.permanentNumber
        nameLabel.text = "\(driver.driver.givenName) \(driver.driver.familyName)"
        pointsLabel.text = driver.points
        constructorColor.backgroundColor = UIColor.Mercedes
    }
}
