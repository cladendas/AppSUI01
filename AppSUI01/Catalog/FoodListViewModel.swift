//
//  FoodListViewModel.swift
//  AppSUI01
//
//  Created by cladendas on 13.12.2021.
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
