//
//  ConstructorCollectionKitCell.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

class ConstructorCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: self)
    
    private lazy var positionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Regular
        label.adjustsFontForContentSizeCategory = true
        label.text = "Position"
        
        return label
    }()
    
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Bold
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .systemRed
        return label
    }()
    
    private lazy var positionVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [positionTitleLabel, positionLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return  stackView
    }()
    
    // MARK: - Title (First HStack)
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Bold
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var nationalityLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.Formula1Font.Regular
        return label
    }()
    
    private lazy var constructorHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, nationalityLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 20
        return  stackView
    }()
    
    // MARK: - Points (VStack)
    private lazy var pointsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Regular
        label.adjustsFontForContentSizeCategory = true
        label.text = "Points"
        return label
    }()
    
    private lazy var pointsLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.Formula1Font.Bold
        label.textColor = .systemRed
        
        //  label.font = UIFont.preferredFont(forTextStyle: .title1).withSize(20)
        return label
    }()
    
    private lazy var pointsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pointsTextLabel, pointsLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Wins (VStack)
    private lazy var winsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Regular
        label.text = "Wins"
        return label
    }()
    
    private lazy var winsLabel: UILabel = {
        let label = UILabel()
        //  label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.font = UIFont.Formula1Font.Bold
        label.textColor = .systemRed
        return label
    }()
    
    private lazy var winsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [winsTextLabel, winsLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Stats (HStack of the VStacks)
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ positionVStackView, pointsStackView, winsStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        //stackView.distribution = .equalCentering
        stackView.spacing = 32
        return stackView
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
        contentView.addSubview(constructorHStackView)
        contentView.addSubview(statsStackView)
    }
    
    func activateConstraints() {
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            constructorHStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            constructorHStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            statsStackView.topAnchor.constraint(equalTo: constructorHStackView.bottomAnchor, constant: inset * 4),
            statsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func applySkin() {
        backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.15)
        
        layer.cornerRadius = 20
    }
    
    func configure(_ constructor: ConstructorStanding) {
        titleLabel.text = constructor.constructor.name
        pointsLabel.text = constructor.points
        winsLabel.text = constructor.wins
        nationalityLabel.text = constructor.constructor.nationality
        positionLabel.text = constructor.position
    }
}
