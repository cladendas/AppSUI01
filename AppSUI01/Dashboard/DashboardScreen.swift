//
//  DashboardScreen.swift
//  AppSUI01
//
//  Created by cladendas on 12.12.2021.
//

import SwiftUI

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
            
            //ПРОБЛЕМА!!!
            //кнопки накладываются друг на друга
//            Button {
//                isAboutAvtive.toggle()
//            } label: {
//                VStack {
//                    Image(systemName: "person.circle")
//                    Text("About 1")
//                }
//            }
            
//            Spacer()
            
            Button {
                dashboardViewModel.isContactShowed.toggle()
            } label: {
                VStack {
                    Image(systemName: "text.book.closed")
                    Text("Contact")
                }
            }.sheet(isPresented: $dashboardViewModel.isContactShowed) {
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
