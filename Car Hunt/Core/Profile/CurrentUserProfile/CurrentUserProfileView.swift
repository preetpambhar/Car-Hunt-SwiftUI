//
//  CurrentUserProfileView.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-05.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    let user: User
    var body: some View {
        NavigationStack{
            List {
                //HeaderView
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                
                //account info
                Section("Account Information"){
                    HStack{
                        Text("Name")
                        Spacer()
                        Text(user.fullName)
                    }
                    HStack{
                        Text("Email")
                        Spacer()
                        Text("User12@gmail.com")
                    }
                    
                }
                //legal
                Section("Legal"){
                    Text("www.apple.com")
                }
                
                //logout/delete
                Section{
                    Button("Logout"){
                        print("logout user")
                    }
                    .foregroundStyle(.red)
                }
                
                Section{
                    Button("Delete"){
                        print("delete user")
                    }.foregroundStyle(.red)
                        .navigationBarTitleDisplayMode(.inline)
                        .fullScreenCover(isPresented: $showEditProfile){
                            EditProfileView(user: user)
                        }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
