//
//  String.swift
//  Formula 1
//
//  Created by Gio on 11/18/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation

extension String {
    /// Current solution to resolve vertical alignment for single and double-digit position values
    var positionNumber: String {
       return count == 1 ?  "  \(self)" :  self
    }
}
