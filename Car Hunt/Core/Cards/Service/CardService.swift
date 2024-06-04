//
//  CardService.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import Foundation

struct CardService{
    func fetchCardModels() async throws -> [CardModel]{
        let users = MockData.users
        return users.map({CardModel(user: $0)})
    }
}
