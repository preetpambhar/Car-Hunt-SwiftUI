//
//  UserInfoView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-02.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text("Black Car")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("$40K")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button{
                    print("Show Profile here")
                    } label: {
                    Image(systemName: "arrow.up.circle")
                            .fontWeight(.bold)
                            .imageScale(.large)
                }
            }
            Text("Car | Black Color")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView()
}
