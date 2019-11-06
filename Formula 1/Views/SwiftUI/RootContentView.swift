//
//  ContentView.swift
//  Formula 1
//
//  Created by Gio on 11/1/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import SwiftUI

struct RootContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                //ViewControllerRepresentation<DriversTableView>()
                DriversListView() /* SwiftUI version */
            }
            .tabItem {
                Text("Drivers")
            }
            
            NavigationView {
                ViewControllerRepresentation<ConstructorsCollectionViewController>()
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
