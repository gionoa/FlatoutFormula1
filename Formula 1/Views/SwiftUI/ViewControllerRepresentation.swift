//
//  ViewControllerRepresentation.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
import SwiftUI

/**

 Struct that wraps a UIViewController for use in SwiftUI Views.
 - Usage: ```ViewControllerRepresentation<ViewController>()```

 */
struct ViewControllerRepresentation<ViewController: UIViewController>: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController { UINavigationController(rootViewController: ViewController()) }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}
