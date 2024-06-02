//
//  CardView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-02.
//

import SwiftUI

struct CardView: View {
    @State private var  xOffset: CGFloat = 0
    @State private var degress: Double = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top){
                Image(.blackCar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .clipped()
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            UserInfoView()
              
        }
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
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degress = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        if abs(width) < abs(SizeConstants.screenCutoff) {
            xOffset = 0
            degress = 0
        }
    }
   
}


#Preview {
    CardView()
}
