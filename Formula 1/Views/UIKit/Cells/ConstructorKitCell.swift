//
//  ConstructorCollectionKitCell.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Constructor Collection View Cell
class ConstructorKitCell: UICollectionViewCell {    
    // MARK: - Properties
    private lazy var positionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Regular
        label.adjustsFontForContentSizeCategory = true
        #warning("TODO: Use Localized string")
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
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 16
        return  stackView
    }()
    
    // MARK: - Points (VStack)
    private lazy var pointsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Formula1Font.Regular
        label.adjustsFontForContentSizeCategory = true
        #warning("TODO: Use Localized string")
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
        #warning("TODO: Use Localized string")
        label.text = "Wins"
        return label
    }()
    
    private lazy var winsLabel: UILabel = {
        let label = UILabel()
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
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 32
        return stackView
    }()
    
    private lazy var finalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ constructorHStackView, statsStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 32
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
extension ConstructorKitCell {
    func setupUI() {
       // contentView.addSubview(constructorHStackView)
        //        contentView.addSubview(statsStackView)
               contentView.addSubview(finalStackView)
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([

            finalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            finalStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
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
    
    func configure(_ constructor: ConstructorStanding) {
        titleLabel.text = constructor.constructor.name
        pointsLabel.text = constructor.points
        winsLabel.text = constructor.wins
        nationalityLabel.text = constructor.constructor.nationality
        positionLabel.text = constructor.position
    }
}
