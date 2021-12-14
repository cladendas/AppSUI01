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
    
    @Published private(set) var numbers: [Int] = Array(0..<100)
    @Published private(set) var numbersFallback: [[Int]] = .init() // iOS 13
    
    init() {
        collectArticleAsGrid()
    }
    
    // iOS13 Fallback
    func collectArticleAsGrid() {
        let columned = numbers.publisher.collect(3) // [[0,1,2], [3,4,5], ...] of Publishers
        _ = columned.collect().sink {
            self.numbersFallback = $0
        }
    }
}

struct Food: Identifiable {
    var id: String { name }
    let name: String
    let isFav: Bool
}
