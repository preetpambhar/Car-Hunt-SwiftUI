//
//  CardImageIndicatorView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import SwiftUI

struct CardImageIndicatorView: View {
    
    let imageCount:Int
    let currentImageIndex: Int
    
    var body: some View {
        HStack{
            ForEach(0..<imageCount, id: \.self){
                index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private  extension CardImageIndicatorView{
    var imageIndicatorWidth: CGFloat
    {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}
#Preview {
    CardImageIndicatorView(imageCount: 5, currentImageIndex: 1)
        .preferredColorScheme(.dark)
}
