//
//  ContentView.swift
//  Formula 1
//
//  Created by Gio on 11/1/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import SwiftUI

// MARK: - SwiftUI Root View (Entry point)
struct RootContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                DriversListView() /* SwiftUI version */
                .navigationBarTitle("Drivers")
            }
            .tabItem {
                Text("Drivers")
            }
            
            NavigationView {
                ViewControllerRepresentation<ConstructorsViewController>()
            }
            .tabItem {
                Text("Constructors")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContentView()
    }
}
