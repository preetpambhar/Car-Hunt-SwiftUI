//
//  MockData.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "BMW",
            age: 2,
            profileImageURLs: ["blackCar","bmw"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Ferrari",
            age: 6,
            profileImageURLs: ["redCar","bmw"]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Mustang",
            age: 3,
            profileImageURLs: ["mustang","bmw"]
        )
    ]
}
