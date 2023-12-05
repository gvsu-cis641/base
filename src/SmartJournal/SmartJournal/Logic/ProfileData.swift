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
    
    // Add other backend-related functions here
}

