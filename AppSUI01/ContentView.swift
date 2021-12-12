//
//  ContentView.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            DashboardScreen()
                .tabItem {
                    VStack {
                        
                        Label("Dashboard", systemImage: "paperplane")
                    }
                }
                .tag(0)
            
            CatalogScreen()
                .tabItem {
                    Label("catalog", systemImage: "folder")
                }
                .tag(1)
            
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
