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

struct DriversListView: View {
    @ObservedObject var viewModel = DriversViewModel()
    
    var body: some View {
        List(viewModel.driversArray) { driver in
            NavigationLink(destination:
                Text("Detail")
                    .navigationBarTitle(Text("\(driver.givenName) \(driver.familyName)"))) {
                        
                DriverCell(firstName: driver.givenName, lastName: driver.familyName, driverNumber: driver.permanentNumber)
            }
        }
        .navigationBarTitle("Drivers")
    }
}
