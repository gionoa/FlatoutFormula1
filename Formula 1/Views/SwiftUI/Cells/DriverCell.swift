//
//  DriverCell.swift
//  Formula 1
//
//  Created by Gio on 11/15/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - SwiftUI View
struct DriverCell: View {
    @ObservedObject var imageLoader = ImageLoader()
    
    let firstName: String
    let lastName: String
    let driverNumber: String
    
    var body: some View {
        HStack {
            Image(uiImage: imageLoader.image ?? UIImage(systemName: "doc.text") as! UIImage)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .shadow(color: .gray, radius: 5.0, x: 0.0, y: 2.0)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center, spacing: 8) {
                    Text(firstName)
                        .font(Font(UIFont.Formula1Font.Black)
                            .weight(.light))
                    
                    Text(lastName)
                        .font(Font(UIFont.Formula1Font.Black)
                            .weight(.medium))
                    
                }
                
                Text(driverNumber)
                    .font(Font(UIFont.Formula1Font.Black)
                        .weight(.regular))
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            self.imageLoader.getImage(urlString: DriverImgUrl.hamilton.rawValue)
        }
    }
}

enum DriverImgUrl: String {
    case leclerc =  ""
    case vettel = "d"
    case hamilton = "https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.1024.medium.jpg"
    case bottas = "c"
    case verstappen = "v"
    case albon = "b"
    case sainz = "s"
}
