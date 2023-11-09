//
//  ProfileView.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/7/23.
//

import SwiftUI


struct ProfileView: View {
    
    private let userName = Text("John Doe")
    private let image = HashableImage(image: Image(systemName: "photo"))
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                userName
                    .font(.title)
                }
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                Spacer()}
            Spacer()
            Button {
                } label: {
                    Text("Edit Profile")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(DarkButtonStyle()) // Apply the custom button style
                .padding(.top)
                .padding(.bottom)
            
            //Need to add label texts on the top left corner of the texts elements
            CustomTextView(text: "Hey I am having fun")
            CustomTextView(text: "johndoe@gmail.com")
            CustomTextView(text: "johndoe123")
            CustomTextView(text: "Student")
            Spacer()
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(30)
    }
}

#Preview {
    ProfileView()
}
