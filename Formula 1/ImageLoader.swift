//
//  ImageLoader.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage = UIImage(systemName: "doc.txt")
}
