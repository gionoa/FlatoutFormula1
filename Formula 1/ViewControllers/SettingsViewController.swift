//
//  SettingsViewController.swift
//  Formula 1
//
//  Created by Giovanni Noa on 2/22/20.
//  Copyright © 2020 Gio. All rights reserved.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    static let shared = SettingsViewModel()
    
    @Published var year = "2019"
}

struct SettingsCell: View {
    var year: String
    
    var title: String
    
    init(navTitle: String, year: String) {
        self.year = year
        title = navTitle
    }
    
    var body: some View {
        
        HStack {
            Text("Year")
            //.font(UIFont.Formula1Font.Regular)
            
            Spacer()
            
            Text(year)
            //.font(UIFont.Formula1Font.Black)
            
        }
        .navigationBarTitle(title)
    }
}

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel = SettingsViewModel.shared) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {                
                NavigationLink(destination: ViewControllerRepresentation<SelectYearViewController>()) {
                    SettingsCell(navTitle: "Select F1 Year", year: viewModel.year)
                }
                .navigationBarTitle("Settings")
            }
        .navigationBarTitle("Settings")
        }
    }
}


