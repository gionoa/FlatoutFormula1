//
//  CircuitCell.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Circuit Collection View Cell
class CircuitCell: UICollectionViewCell {
    // MARK: - Static Reuse Identifier
    static let reuseIdentifier = String(describing: self)
    
    // MARK: - Properties
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.Formula1Font.Regular
        return label
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        applySkin()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions
extension CircuitCell {
    func setupUI() {
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func applySkin() {
        backgroundColor = .systemGray6
        
        #warning("TODO: Don't sub-pixel")
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.systemGray2.cgColor
        
        layer.cornerRadius = 20
        layer.cornerCurve = .continuous
    }
    
    func configure(with circuit: Circuit) {
        nameLabel.text = circuit.circuitName
    }
}
