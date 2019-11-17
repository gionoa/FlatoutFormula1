//
//  UIFont.swift
//  Formula 1
//
//  Created by Gio on 11/9/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit

// MARK: - Font extension
extension UIFont {
    // MARK: - Formula 1 Font
    enum Formula1Font {
        private enum F1Font: String, RawRepresentable {
            case Black = "Formula1-Display-Black"
            case Bold = "Formula1-Display-Bold"
            case Regular = "Formula1-Display-Regular"
            case Wide = "Formula1-Display-Wide"
           // case Navigation
        }
        
        // MARK: - Font types
        static var Black: UIFont { font(for: F1Font.Black.rawValue) }
        static var Bold: UIFont { font(for: F1Font.Bold.rawValue) }
        static var Regular: UIFont { font(for: F1Font.Regular.rawValue) }
        static var Wide: UIFont { font(for: F1Font.Wide.rawValue) }
        static var Nav: UIFont { navFont(for: F1Font.Regular.rawValue) }
    }    
}

// MARK: - Font Builders
fileprivate func font(for font: String) -> UIFont {
    guard let customFont = UIFont(name: font, size: UIFont.labelFontSize) else {
                        fatalError("""
                            Failed to load the "Formula1-Display-Bold" font.
                            Make sure the font file is included in the project and the font name is spelled correctly.
                            """)
                    }
             
    return UIFontMetrics.default.scaledFont(for: customFont)
}

fileprivate func navFont(for font: String) -> UIFont {
    guard let customFont = UIFont(name: font, size: 40) else {
                        fatalError("""
                            Failed to load the "Formula1-Display-Bold" font.
                            Make sure the font file is included in the project and the font name is spelled correctly.
                            """)
                    }
             
    return UIFontMetrics.default.scaledFont(for: customFont)
}
