//
//  Car_HuntApp.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-02.
//

import SwiftUI

@main
struct Car_HuntApp: App {
    @StateObject var matchManager = MatchManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}
