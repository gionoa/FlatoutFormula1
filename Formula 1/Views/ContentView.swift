//
//  ContentView.swift
//  Formula 1
//
//  Created by Gio on 11/1/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                DriversListView()
                    .tabItem {
                        Text("Drivers")
                }
                
                Text("Constructors")
                    .tabItem {
                        Text("Constructors")
                }
            }
            .navigationBarTitle("Drivers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
