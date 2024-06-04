//
//  CardStackView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import SwiftUI

struct CardStackView: View {
    
    @StateObject var viewModel  = CardsViewModel (service: CardService())
    var body: some View {
        ZStack{
            ForEach(viewModel.cardModels){card in
                CardView(viewModel: viewModel, model: card)
            }
        }
        .onChange(of: viewModel.cardModels) { oldValue, newValue in
            print("DEBUG: Old value count is \(oldValue.count)...")
            print("DEBUG: Old value count is \(newValue.count)...")
        }
    }
}

#Preview {
    CardStackView()
}
