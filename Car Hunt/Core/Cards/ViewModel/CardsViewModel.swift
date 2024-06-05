//
//  CardViewModel.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import Foundation

@MainActor
class CardsViewModel : ObservableObject{
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardService
    
    init(service: CardService){
        self.service = service
        Task { await fetchCardModels()}
    }
    
    func fetchCardModels() async{
        do{
            self.cardModels = try await service.fetchCardModels()
        } catch{
            print("DEBUG: Failed to fetch cards with errors: \(error)")
        }
    }
    func removeCard(_ card: CardModel){
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else {return}
        cardModels.remove(at: index)
    }
}
