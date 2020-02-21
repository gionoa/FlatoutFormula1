//
//  YearTableViewCell.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/20/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import UIKit

final class SeasonKitCell: UITableViewCell {
    static let reuseID = "Cell"
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.Formula1Font.Regular
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SeasonKitCell {
    private func setupUI() {
        addSubview(yearLabel)
        
        let inset: CGFloat = 8.0
        let margins = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            yearLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            yearLabel.topAnchor.constraint(equalTo: margins.topAnchor)
        ])
    }
    
    func configure(with season: Season) {
        yearLabel.text = season.season
    }
}
