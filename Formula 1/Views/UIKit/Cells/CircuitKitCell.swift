//
//  CircuitCell.swift
//  Formula 1
//
//  Created by Gio on 11/13/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Circuit Collection View Cell
class CircuitCell: UICollectionViewCell {    
    // MARK: - Properties
    @ObservedObject private(set) var imageLoader = ImageLoader()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
       // label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.Formula1Font.Regular
        return label
    }()
    
//    lazy var image: UIImageView = {
//        let imageView = UIImageView()
//
//        imageLoader.getImage(urlString: "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Germany_Circuit.png.transform/7col-retina/image.pnghttps://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Germany_Circuit.png.transform/7col-retina/image.png")
//        imageView.image = imageLoader.image {
//
//        }
//        return imageView
//    }()
//
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
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
        
       // contentView.addSubview(nameLabel)
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
//            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
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
