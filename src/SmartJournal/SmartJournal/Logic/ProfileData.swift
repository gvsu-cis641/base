//
//  ProfileData.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 12/4/23.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class FirebaseManager {
    static let shared = FirebaseManager()
    
    internal init() {
        // Initialize Firebase if needed
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    func createAccountAndAddUser(email: String, username: String, password: String, con_password: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            } else if let authResult = authResult {
                // User account created successfully, now add a new entry in the "users" collection
                let user = UserProfile(id: authResult.user.uid, displayName: username, bio: "Enter your bio", email: email)
                self.addUserToFirestore(uid: authResult.user.uid, user: user, completion: completion)
            }
        }
    }
    
    private func addUserToFirestore(uid: String, user: UserProfile, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        let userRef = Firestore.firestore().collection("users").document(uid)
        
        userRef.setData([
            "displayName": user.displayName,
            "bio": user.bio,
            "email": user.email
        ]) { error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            } else {
                completion(.success(user))
                print("User added to Firestore successfully")
            }
        }
    }
    
}

