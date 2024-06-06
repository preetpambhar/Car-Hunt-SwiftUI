//
//  CardStackView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import SwiftUI

struct CardStackView: View {
    
    @State private var showMatchView = false
    //@StateObject var matchManager = MatchManager()
    @StateObject var viewModel  = CardsViewModel (service: CardService())
    @EnvironmentObject var matchManager: MatchManager
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                .blur(radius: showMatchView ? 20 : 0)
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
                
            }
            .animation(.easeIn, value: showMatchView)
            .onReceive(matchManager.$matchedUser) { user in
                showMatchView = user != nil
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
        .environmentObject(MatchManager())
}
