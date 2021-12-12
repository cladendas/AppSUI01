//
//  LazyView.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

///обёртка, чтобы дестинейшн сразу не рендерился, но только когда на него передут
struct LazyView<Content: View>: View {
    private let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
