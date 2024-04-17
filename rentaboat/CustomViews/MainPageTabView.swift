//
//  MainPageTabView.swift
//  rentaboat
//
//  Created by yasin on 5.04.2024.
//

import SwiftUI

public enum SelectedTab: Int {
    case home = 0
    case profile = 1
}

struct MainPageTabView: View {
    @State var selectedItem = SelectedTab.home
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedItem ) {
                CustomerMainPageView(viewModel: CustomerPageViewModel())
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                LoginView( selectedItem: $selectedItem)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }.onAppear() {
                UITabBar.appearance().backgroundColor = .white
             
            }
            .tint(.blue)
        }
    }
}

#Preview {
    MainPageTabView()
}
