//
//  User.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import Foundation


struct User: Identifiable, Hashable{
    let id: String
    let fullName: String
    var age: Int
    var profileImageURLs: [String]
}
