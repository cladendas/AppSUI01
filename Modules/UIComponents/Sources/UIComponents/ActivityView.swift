//
// ActivityView.swift
//  
//
//  Created by cladendas on 13.12.2021.
//

import UIKit
import SwiftUI

public struct ActivityView: UIViewRepresentable {
    
    public init() {
        
    }
    
    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}
