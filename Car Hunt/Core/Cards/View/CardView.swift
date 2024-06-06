//
//  CardView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-02.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var matchManager: MatchManager
    @State private var  xOffset: CGFloat = 0
    @State private var degress: Double = 0
    @State private var currentImageIndex = 0
    @ObservedObject var viewModel: CardsViewModel
    @State private var showProfileModel = false
    
    let model: CardModel
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top){
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .clipped()
                    .overlay{
                        ImageScollingOverlay(imageCount: imageCount, currentImageIndex: $currentImageIndex)
                    }
                CardImageIndicatorView(imageCount: imageCount, currentImageIndex: currentImageIndex)
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            UserInfoView(showProfileModel: $showProfileModel, user: user)
        }
        .fullScreenCover(isPresented: $showProfileModel) {
            UserProfileView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degress))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}
private extension CardView{
    func returnToCenter(){
        xOffset = 0
        degress = 0
        
    }
    func swipeRight(){
        withAnimation {
            xOffset = 500
            degress = 12
        } completion: {
            viewModel.removeCard(model)
        }
        matchManager.checkForMatch(withuser: user)
    }
    func swiprLeft(){
        withAnimation {
            xOffset = -500
            degress = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    func onReceiveSwipeAction(_ action: SwipeAction? ){
        guard let action else{ return }
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swiprLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degress = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        if abs(width) < abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        if width >= SizeConstants.screenCutoff{
            swipeRight()
        }else {
            swiprLeft()
        }
    }
    
    
}


#Preview {
    CardView(
        viewModel: CardsViewModel(service: CardService()),
        model: CardModel( user: MockData.users[1])
    )
}
