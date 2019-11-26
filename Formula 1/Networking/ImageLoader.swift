//
//  ImageLoader.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Image Loader
class ImageLoader: ObservableObject {
    // MARK: - Properties
    @Published var image: UIImage!
}

// MARK: - Functions
extension ImageLoader {
    func getImage(urlString: String, _ completion: @escaping (() -> Void?)) {
           WebService.fetchImage(urlString: urlString)
               .sink(receiveCompletion: { completion in })
               { image in
                   self.image = image
                   completion()
               }
           }
}
