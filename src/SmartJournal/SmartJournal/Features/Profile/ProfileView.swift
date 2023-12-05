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
    @StateObject private var authState = UserAuthenticationState()
    
    @State private var userProfile: UserProfile?
    @State private var isLoading = false
    let userId: String
    
    private let image = HashableImage(image: Image(systemName: "photo"))
    var body: some View {
        if authState.isSignedIn {
            if let user = authState.user {
                
                NavigationStack {
                    
                    VStack(alignment: .leading, content: {
                        if let userProfile = userProfile {
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                Spacer()}
                            Spacer()
                            NavigationLink("Edit Profile") {
                                EditProfile(username: userProfile.displayName, email: userProfile.email, bio: userProfile.bio ?? "N/A")
                            }
                            .buttonStyle(ActionButton()) // Apply the custom button style
                            .padding(.top)
                            .padding(.bottom)
                            
                            CustomTextView(text: userProfile.bio ?? "", labelText: "Bio")
                            
                            CustomTextView(text: userProfile.email, labelText: "Email")
                            CustomTextView(text: userProfile.displayName, labelText: "Username")
                            
                            Spacer()
                        }
                        else {
                            // Show error or placeholder content
                            CircularLoadingView()
                                            .padding()
                        }
                        
                    })
                    .navigationTitle(userProfile?.displayName ?? "N/A")
                    .navigationBarBackButtonHidden(true)
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(30)
                    .onAppear{
                        let firebaseManager = FirebaseManager()
                        // Call the function from the static class when the view appears
                        firebaseManager.getUserProfileData(user_id: userId) { result in
                            DispatchQueue.main.async {
                                switch result {
                                case .success(let userProfile):
                                    self.userProfile = userProfile
                                case .failure(let error):
                                    print("Error: \(error.localizedDescription)")
                                    // Handle the error
                                }
                                self.isLoading = false
                            }
                        }
                    }
                }
            } else {
                AuthenticationView()
                
                
            }
        }
    }
}



