//
//  ProfileView.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/7/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore


struct ProfileView: View {
    @ObservedObject var viewModel = UserProfileViewModel()
    @State private var isSignInPresented = false
    private let image = HashableImage(image: Image(systemName: "photo"))
    
    var body: some View {
        if let user = viewModel.user {
            VStack(alignment: .leading, content: {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Spacer()}
                Spacer()
                NavigationLink(destination: EditProfileView()) {
                    Text("Edit Profile")

                }
                .buttonStyle(ActionButton()) // Apply the custom button style
                .padding(.top)
                .padding(.bottom)
                
                CustomTextView(text: user.displayName, labelText: "Username")
                
                CustomTextView(text: user.email, labelText: "Email")
                CustomTextView(text: user.bio, labelText: "Bio")
                
                Spacer()
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
            .onAppear {
                // Check if the user is signed in

                // Fetch information about the current user when the view appears
                viewModel.fetchCurrentUserData()
                if Auth.auth().currentUser == nil {
                    isSignInPresented = true
                }
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $isSignInPresented) {
                // Present your authentication view here
                AuthenticationView()
            }
        } else {
            CircularLoadingView()
            .padding()
        }
        
    }
}
