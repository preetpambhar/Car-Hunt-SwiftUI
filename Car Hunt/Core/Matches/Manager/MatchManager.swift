//
//  MatchManager.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-05.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser: User?
    func checkForMatch(withuser user: User){
       let didMatch = Bool.random()
        if didMatch{
            matchedUser = user
        }
    }
}
