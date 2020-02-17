//
//  DriversListView.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// MARK: - Drivers SwiftUI Table View
struct DriversListView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = DriversViewModel()
    
    var body: some View {
        List(viewModel.dataSource) { driver in
            NavigationLink(destination:
                Text("Detail")
                    .navigationBarTitle(Text("\(driver.driver.givenName) \(driver.driver.familyName)"))) {
                        
                        DriverCell(firstName: driver.driver.givenName, lastName: driver.driver.familyName, driverNumber: driver.driver.permanentNumber)
            }
        }
        .navigationBarTitle("Drivers")
    }
}
