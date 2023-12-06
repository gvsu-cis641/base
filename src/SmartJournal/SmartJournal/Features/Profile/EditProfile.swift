//
//  EditProfile.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/14/23.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore
import FirebaseCore

import SwiftUI

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var viewModel = UserProfileViewModel()
    @State private var newName: String = ""
    @State private var newBio: String = ""
    @State private var newEmail: String = ""
    @State private var newPassword: String = ""
    
    let radius: CGFloat = 100
    var offset: CGFloat {
        sqrt(radius * radius / 2)
    }
    
    @StateObject private var viewModelPhotoPicker = SinglePhotoPickerViewModel()
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, content: {
            
            HStack(content: {
                Spacer()
                HStack {
                    Spacer()
                    //Need to create a custom component for profile pic
                    if (viewModelPhotoPicker.photo == nil) {
                        Image( systemName: "person.circle.fill")
                        
                        .resizable()
                        .frame(width: 200, height: 200)
                        .overlay(
                            PhotosPicker(selection: $viewModelPhotoPicker.imageSelection, matching: .images) {
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
                        viewModelPhotoPicker.photo?.image
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(
                                PhotosPicker(selection: $viewModelPhotoPicker.imageSelection, matching: .images) {
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
            
            TextField("Enter your bio", text: $newBio)
                .modifier(InputField())
            
            LabelsForTextFields(labelText: "Email")
            TextField("Email", text: $newEmail)
                .modifier(InputField())
            
            LabelsForTextFields(labelText: "Username")
            TextField("Username", text: $newName)
                .modifier(InputField())
            
            LabelsForTextFields(labelText: "Password")
            SecureField("Password", text: $newPassword)
                .modifier(InputField())
            
            
            Button("Save Changes") {
                viewModel.updateProfile(name: newName, email: newEmail, bio: newBio)
                
                // Dismiss the current view and go back to the profile view
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(ActionButton())
            .padding(.top)
            .padding(.bottom)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(30)
        .onAppear {
            // Fetch information about the current user when the view appears
            viewModel.fetchCurrentUserData()
            // Set the initial values in the text fields
            newName = viewModel.user?.displayName ?? ""
            newBio = viewModel.user?.bio ?? ""
            newEmail = viewModel.user?.email ?? ""
        }
    }
}
