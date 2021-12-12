//
//  CatalogScreen.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

final class FoodListViewModel: ObservableObject {
    
    @Published var isFavEnabled: Bool = false
    
    @Published private(set) var food = [
        Food(name: "Strawberry", isFav: false),
        Food(name: "Cheese", isFav: true),
        Food(name: "Apple", isFav: true),
        Food(name: "Tomato", isFav: false)
    ]
    
}

struct Food: Identifiable {
    var id: String { name }
    let name: String
    let isFav: Bool
}

struct CatalogScreen: View {
    
    @ObservedObject var foodListViewModel: FoodListViewModel = .init()
    
    var body: some View {
        
        List {
            CatalogFilterCell()
                .environmentObject(foodListViewModel)
            
            ForEach(foodListViewModel.food) { food in
                Label(food.name, systemImage: "leaf")
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
