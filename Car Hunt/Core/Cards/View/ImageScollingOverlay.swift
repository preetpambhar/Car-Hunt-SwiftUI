//
//  ImageScollingOverlay.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-03.
//

import SwiftUI

struct ImageScollingOverlay: View {
    
    let imageCount:Int
    
    @Binding var currentImageIndex: Int
    var body: some View {
        HStack{
            Rectangle()
                .onTapGesture {
                   updateImageIndex(increment: false)
                }
            
            Rectangle()
                .onTapGesture {
                    print("Go to next image...")
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScollingOverlay{
    func updateImageIndex(increment: Bool){
        if increment{guard currentImageIndex < imageCount-1 else { return }
            currentImageIndex += 1
        }else{
            guard currentImageIndex > 0 else{return}
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScollingOverlay(imageCount: 2, currentImageIndex: .constant(1))
}
