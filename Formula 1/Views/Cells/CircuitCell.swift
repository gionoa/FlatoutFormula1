//
//  CircuitCell.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

class CircuitCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: self)
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Regular
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        activateConstraints()
        applySkin()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(nameLabel)
    }
    
    func activateConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false 
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func applySkin() {
          backgroundColor = UIColor(red: 220 / 255, green: 220 / 255, blue: 220 / 255, alpha: 0.15)
          layer.borderWidth = 0.2
          layer.borderColor = UIColor.lightGray.cgColor
          layer.cornerRadius = 20
      }
    
    func configure(_ circuit: Circuit) {
        nameLabel.text = circuit.circuitName
    }
}
