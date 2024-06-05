//
//  ProfileImageGrideView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-05.
//

import SwiftUI

struct ProfileImageGrideView: View {
    let user: User
    
    var body: some View {
        LazyVGrid(columns: coloums, spacing: 16) {
            ForEach(0..<6){ index in
                if index < user.profileImageURLs.count{
                    Image(user.profileImageURLs[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                else{
                    ZStack(alignment: .bottomTrailing){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: imageWidth, height: imageHeight)
                        
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(Color(.systemPink))
                            .offset(x: 4, y: 4)
                    }
                }
           }
        }
    }
}
private extension ProfileImageGrideView {
    private var coloums: [GridItem]{
        [.init(.flexible()),
         .init(.flexible()),
         .init(.flexible())
        ]
    }
    var imageWidth: CGFloat{
        110
    }
    var imageHeight: CGFloat{
        160
    }
}

#Preview {
    ProfileImageGrideView(user: MockData.users[0])
}
