//
//  CardStackView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import SwiftUI

struct CardStackView: View {
    var body: some View {
        ZStack{
            ForEach(0..<10){card in
            CardView()
            }
        }
    }
}

#Preview {
    CardStackView()
}
