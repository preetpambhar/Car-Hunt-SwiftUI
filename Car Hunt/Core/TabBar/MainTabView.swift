//
//  MainTabBar.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-02.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            CardStackView()
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            
            Text("Search view")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            Text("Inbox view")
                .tabItem { Image(systemName: "bubble") }
                .tag(2)
            
            CurrentUserProfileView(user: MockData.users[0])
                .tabItem { Image(systemName: "person") }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView().environmentObject(MatchManager())
}
