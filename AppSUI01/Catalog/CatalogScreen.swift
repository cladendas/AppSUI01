//
//  CatalogScreen.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

struct CatalogScreen: View {
    @ObservedObject var foodListViewModel: FoodListViewModel = .init()
    var body: some View {
        FoodList()
            .environmentObject(foodListViewModel)
    }
}

struct FoodList: View {
    @EnvironmentObject var foodListViewModel: FoodListViewModel
    
    var body: some View {
        List {
            CatalogFilterCell()
                .environmentObject(foodListViewModel)
            
            ForEach(foodListViewModel.food) { food in
                if !foodListViewModel.isFavEnabled || food.isFav {
                    Label(food.name, systemImage: "leaf")
                }
            }
        }
        .listStyle(.plain)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CatalogFilterCell: View {
    @EnvironmentObject var foodListViewModel: FoodListViewModel
    var body: some View {
        Toggle(isOn: $foodListViewModel.isFavEnabled) {
            Text("Show Favorites")
        }
    }
}

struct CatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreen()
    }
}
