//
//  UserInfoView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-02.
//

import SwiftUI

struct UserInfoView: View {
    let user: User
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(user.age)")
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
            Text("Test | Car | Black Color")
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
    UserInfoView(user: MockData.users[1])
}
