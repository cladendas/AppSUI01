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
        
        NavigationView {
            FoodList()
                .environmentObject(foodListViewModel)
                .navigationTitle("Foods")
                .navigationBarHidden(true)
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct FoodList: View {
    @EnvironmentObject var foodListViewModel: FoodListViewModel
    // Preferences
    @State private var listHeight: CGFloat = 800
    @State var listViewTypeChoise: Int = 0
    var listTypes = ["List", "Lazy Grid", "Grid iOS 13"]
    //Lazy Grid >= iOS14
    var columns: [GridItem] = Array(repeating: .init(), count: 3)
    var body: some View {
        ScrollView {
            VStack {
                Picker("Lists", selection: $listViewTypeChoise) {
                    ForEach(0..<listTypes.count) { index in
                        Text(listTypes[index])
                            .tag(index)
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 30)
                
                if listViewTypeChoise == 0 {
                    list
                        .background(GeometryReader {
                            Color.clear.preference(key: ViewHeightKey.self, value: $0.frame(in: .local).size.height)
                        })
                        .onPreferenceChange(ViewHeightKey.self) { self.listHeight = $0 }
                } else if listViewTypeChoise == 1 {
                    lazyGrid
                } else {
                    gridIO13
                }
            }
            .frame(minHeight: listHeight)
        }
    }
    
    var list: some View {
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
    }
    
    var lazyGrid: some View {
        LazyVGrid(columns: columns) {
            ForEach(foodListViewModel.numbers, id: \.self) { item in
                GridCell(item: item)
            }
        }
        .padding(.horizontal, 20)
    }
    
    var gridIO13: some View {
        VStack(spacing: 8) {
            ForEach(0..<foodListViewModel.numbersFallback.count, id: \.self) { row in
                //Row
                HStack(spacing: 8) {
                    ForEach(foodListViewModel.numbersFallback[row], id: \.self) { item in
                        GridCell(item: item)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct GridCell: View {
    
    var item: Int = 0
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.gray)
            
            VStack {
                Text("\(item)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        
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
