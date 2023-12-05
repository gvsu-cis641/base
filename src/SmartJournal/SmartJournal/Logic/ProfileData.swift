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

import Firebase

struct UserProfile {
    var displayName: String
    var photoURL: String?
    var bio: String?
    var email: String
}

class FirebaseManager {
    static let shared = FirebaseManager()
    
    internal init() {
            // Initialize Firebase if needed
            if FirebaseApp.app() == nil {
                FirebaseApp.configure()
            }
        }
    
    func getUserProfileData(user_id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        let docRef = Firestore.firestore().collection("users").document(user_id)

        docRef.getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
            } else if let document = document, document.exists {
                if let data = document.data(),
                   let displayName = data["displayName"] as? String,
                   let email = data["email"] as? String {
                    
                    let photoURL = data["photoURL"] as? String
                    let bio = data["bio"] as? String
                    
                    let userProfile = UserProfile(displayName: displayName, photoURL: photoURL, bio: bio, email: email)
                    
                    completion(.success(userProfile))
                    
                } else {
                    completion(.failure(NSError(domain: "Firestore", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                }
            } else {
                completion(.failure(NSError(domain: "Firestore", code: 2, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"])))
            }
        }
    }
    
    func createAccountAndAddUser(email: String, username: String, password: String, con_password: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    completion(.failure(error))
                    print(error.localizedDescription)
                } else if let authResult = authResult {
                    // User account created successfully, now add a new entry in the "users" collection
                    let user = UserProfile(displayName: username, photoURL: nil, bio: nil, email: email)
                    self.addUserToFirestore(uid: authResult.user.uid, user: user, completion: completion)
                }
            }
        }

        private func addUserToFirestore(uid: String, user: UserProfile, completion: @escaping (Result<UserProfile, Error>) -> Void) {
            let userRef = Firestore.firestore().collection("users").document(uid)

            userRef.setData([
                "displayName": user.displayName,
                "photoURL": user.photoURL ?? NSNull(),
                "bio": user.bio ?? NSNull(),
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

