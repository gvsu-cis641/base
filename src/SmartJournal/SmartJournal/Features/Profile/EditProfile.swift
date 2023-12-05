//
//  EditProfile.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/14/23.
//

import SwiftUI
import PhotosUI
struct EditProfile: View {
    @StateObject private var authState = UserAuthenticationState()
    
    let radius: CGFloat = 100
    var offset: CGFloat {
        sqrt(radius * radius / 2)
    }
    @State private var username: String
    @State private var email: String
    @State private var bio: String
    
    @State private var password = ""
    
    @StateObject private var viewModel = SinglePhotoPickerViewModel()
    
    init(username: String, email: String, bio: String) {
            _username = State(initialValue: username)
            _email = State(initialValue: email)
            _bio = State(initialValue: bio)
        }
    
    private let image = HashableImage(image: Image(systemName: "photo"))
    
    var body: some View {
        if authState.isSignedIn {
            NavigationStack {
                VStack(alignment: .leading,  content:{
                    
                    HStack(content: {
                        Spacer()
                        HStack {
                            Spacer()
                            //Need to create a custom component for profile pic
                            if (viewModel.photo == nil) {
                                Image( systemName: "person.circle.fill")
                                
                                .resizable()
                                .frame(width: 200, height: 200)
                                .overlay(
                                    PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
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
                            }
                            
                            else {
                                //Need to update state of the profile pic so it changes on the profile screen as well
                                viewModel.photo?.image
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                                    .overlay(
                                        PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
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
                            }
                            
                        
                            Spacer()}
                    
                        Spacer()
                        
                    })
                    
                    LabelsForTextFields(labelText: "Bio")
                    
                    TextField("Enter your bio", text: $bio)
                        .modifier(InputField())
                    
                    LabelsForTextFields(labelText: "Email")
                    TextField("Email", text: $email)
                        .modifier(InputField())
                    
                    LabelsForTextFields(labelText: "Username")
                    TextField("Username", text: $username)
                        .modifier(InputField())
                    
                    LabelsForTextFields(labelText: "Password")
                    SecureField("Password", text: $password)
                        .modifier(InputField())
                    
                    NavigationLink("Save", destination: ProfileView(userId: authState.user?.uid ?? "ksjdn"))
                    .buttonStyle(ActionButton()) // Apply the custom button style
                    .padding(.top)
                    .padding(.bottom)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                .padding(30)
                
            }
        }
        
        
    }
}

#Preview {
    EditProfile(username: "John", email: "john@gmail.com", bio: "This is fun")
}
