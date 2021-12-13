//
//  AppSUI01App.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

@main
struct AppSUI01App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(DashboardViewModel())
//        }
//    }
    
    
    //MARK: код ниже позволите смотреть за терминальным состоянием приложения
    @Environment(\.scenePhase) var scenePhase
    
    init() {
      print("📟 AppSUIApp application is starting up. App initialiser.")
    }
    
    var body: some Scene {
      WindowGroup {
          ContentView()
              .environmentObject(DashboardViewModel())
      }
      .onChange(of: scenePhase) { newScenePhase in
        switch newScenePhase {
        case .active:
          print("📟 App is active")
        case .inactive:
          print("📟 App is inactive")
        case .background:
          print("📟 App is in background")
        @unknown default:
          print("📟 Oh - interesting: I received an unexpected new value.")
        }
      }
    }
}
