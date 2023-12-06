//
//  ProfileData.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 12/4/23.
//

import SwiftUI
import Firebase

struct UserProfile {
    var id: String
    var displayName: String
    var bio: String
    var email: String
}

class UserProfileViewModel: ObservableObject {
    @Published var user: UserProfile?
    private var listener: ListenerRegistration?
    
    init() {
        fetchCurrentUserData()
    }

    func fetchCurrentUserData() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        let userID = currentUser.uid
        
        listener = Firestore.firestore().collection("users").document(userID).addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching current user data: \(error.localizedDescription)")
                return
            }

            if let data = snapshot?.data() {
                self.user = UserProfile(
                    id: userID,
                    displayName: data["displayName"] as? String ?? "",
                    bio: data["bio"] as? String ?? "",
                    email: data["email"] as? String ?? ""
                )
            }
        }
    }

    func updateProfile(name: String, email: String, bio: String) {
        guard let userID = user?.id else {
            return
        }
        
        Firestore.firestore().collection("users").document(userID).updateData([
            "displayName": name,
            "email": email,
            "bio": bio
        ]) { error in
            if let error = error {
                print("Error updating user data: \(error.localizedDescription)")
            }
        }
    }
    
    deinit {
        listener?.remove()
    }
}
