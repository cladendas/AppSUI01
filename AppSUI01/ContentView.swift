//
//  ContentView.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 1
    
    var body: some View {
        
        ///здесь $selection позволит выбрать, с какого экрана начать
        TabView(selection: $selection) {
            DashboardScreen()
                .tabItem {
                    Label("Dashboard", systemImage: "paperplane")
                }
                .tag(0)
            
            CatalogScreen()
                .tabItem {
                    Label("Catalog", systemImage: "folder")
                }
                .tag(1)
            
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person")
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
