//
//  DashboardScreen.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI
import UIComponents

struct DashboardScreen: View {
    var body: some View {
        NavigationView() {
            DashboardListView()
        }
    }
}

struct DashboardListView: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State var isAboutAvtive: Bool = false
    
    var body: some View {
        List {
            
            Section(content: {}, header: { ActivityView() } )
            
            DashboardHeadCell(isAboutAvtive: $isAboutAvtive)

            NavigationLink(isActive: $isAboutAvtive) {
                LazyView(AboutAppScreen())
            } label: {
                Text("About App")
            }

        }
        .navigationBarTitle(dashboardViewModel.title)
    }
}

struct DashboardHeadCell: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @Binding var isAboutAvtive: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Image(systemName: "person.circle")
                Text("About 1")
            }
            .onTapGesture {
                isAboutAvtive.toggle()
            }
            
            Spacer()
            
            VStack {
                Image(systemName: "text.book.closed")
                Text("Contact")
            }
            .onTapGesture {
                dashboardViewModel.isContactShowed.toggle()
            }
            .sheet(isPresented: $dashboardViewModel.isContactShowed) {
                ContactScreen()
            }
            
            Spacer()
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
