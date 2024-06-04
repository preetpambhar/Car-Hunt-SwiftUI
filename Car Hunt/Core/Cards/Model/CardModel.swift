//
//  CardModel.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import Foundation

struct CardModel{
    let user: User
}

extension CardModel: Identifiable, Hashable{
    var id: String {return user.id}
}
