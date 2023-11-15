//
//  EditProfile.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/14/23.
//

import SwiftUI

struct EditProfile: View {
    let radius: CGFloat = 100
    var offset: CGFloat {
        sqrt(radius * radius / 2)
    }
    @State private var username: String
    @State private var email: String
    @State private var bio: String
    
    @State private var password = ""
    
    init(username: String, email: String, bio: String) {
            _username = State(initialValue: username)
            _email = State(initialValue: email)
            _bio = State(initialValue: bio)
        }
    
    private let image = HashableImage(image: Image(systemName: "photo"))
    
    var body: some View {
        VStack(alignment: .leading,  content:{
            
            HStack(content: {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .overlay(
                                    Button(action: {}) {
                                        Image(systemName: "camera.fill")
                                            .foregroundColor(.primary)
                                            .padding(8)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .background(
                                                Circle()
                                                    .stroke(Color.gray, lineWidth: 2)
                                            )
                                    }.offset(x: offset, y: offset)
                                )
                    Spacer()}
                Spacer()
                
            })
            TextField("Bio", text: $bio)
                .modifier(InputField())
                .padding( .top)
            TextField("Email", text: $email)
                .modifier(InputField())
                .padding( .top)
            TextField("Username", text: $username)
                .modifier(InputField())
                .padding( .top)
            SecureField("Password", text: $password)
                .modifier(InputField())
                .padding( .top)
            Button {
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(ActionButton()) // Apply the custom button style
                .padding(.top)
                .padding(.bottom)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        
        .padding(30)
        
    }
}

#Preview {
    EditProfile(username: "John", email: "john@gmail.com", bio: "This is fun")
}
