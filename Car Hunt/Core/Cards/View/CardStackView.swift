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
        NavigationStack {
            VStack (spacing: 16) {
                ZStack{
                    ForEach(viewModel.cardModels){card in
                        CardView(viewModel: viewModel, model: card)
                    }
                }
                if !viewModel.cardModels.isEmpty{
                    SwipeActionButtonView(viewModel: viewModel)
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                   // Image(.bmw)
                    Image(systemName: "car.rear.waves.up.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
