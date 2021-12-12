//
//  DashboardViewModel.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

final class DashboardViewModel: ObservableObject {
    
    @Published var title: String = "Dashboard"
    @Published var isContactShowed: Bool = false
}
