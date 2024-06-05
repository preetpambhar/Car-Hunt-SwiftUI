//
//  UserMatchView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-05.
//

import SwiftUI

struct UserMatchView: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            
            VStack(spacing: 120){
                VStack{
                    Text("IT'S MATCH")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("You have added new car in your list.")
                        .foregroundStyle(.white)
                }
                HStack(spacing: 16){
                    Image(MockData.users[0].profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay{
                        Circle()
                            .stroke(.white, lineWidth: 2)
                            .shadow(radius: 4)
                    }
                    Image(MockData.users[1].profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay{
                        Circle()
                            .stroke(.white, lineWidth: 2)
                            .shadow(radius: 4)
                    }
                }
                VStack(spacing: 16){
                    Button("Sens Message"){
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(.capsule)
                    Button("Keep Swipping"){
                        
                    }.font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.clear)
                        .clipShape(.capsule)
                        .overlay{
                            Capsule()
                                .stroke(.white, lineWidth: 1)
                                .shadow(radius: 4)
                        }
                }
            }
        }
    }
}

#Preview {
    UserMatchView(show : .constant(true))
}
