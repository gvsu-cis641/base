//
//  ProfileView.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/7/23.
//

import SwiftUI


struct ProfileView: View {
    
    private let userName = "John Doe"
    private let email = "johndoe@gmail.com"
    private let bio = "Hey I am having fun"
    
    private let image = HashableImage(image: Image(systemName: "photo"))
    var body: some View {
        NavigationView{
            
            VStack(alignment: .leading, content: {
                
                
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Spacer()}
                Spacer()
                NavigationLink("Edit Profile") {
                    EditProfile(username: userName, email: email, bio: bio)
                }
                .buttonStyle(ActionButton()) // Apply the custom button style
                .padding(.top)
                .padding(.bottom)
                
                //Need to add label texts on the top left corner of the texts elements
                CustomTextView(text: bio)
                CustomTextView(text: email)
                CustomTextView(text: userName)
                
                Spacer()
                
                
            })
            .navigationTitle(userName)
            .navigationBarBackButtonHidden(false)
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
        }
    }
    
    func edit_profile() {
       
    }
}

#Preview {
    ProfileView()
}
