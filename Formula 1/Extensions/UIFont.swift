//
//  UIFont.swift
//  Formula 1
//
//  Created by Gio on 11/9/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

extension UIFont {
    static var Formula1Font: UIFont {
        guard let customFont = UIFont(name: "Formula1-Display-Bold", size: UIFont.labelFontSize) else {
                   fatalError("""
                       Failed to load the "Formula1-Display-Bold" font.
                       Make sure the font file is included in the project and the font name is spelled correctly.
                       """)
               }
        
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
}
