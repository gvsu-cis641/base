//
//  ProfileData.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 12/4/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct UserProfile {
    var id: String
    var displayName: String
    var bio: String
    var email: String
    var photoURL: String?
    var photo: UIImage?
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
                    email: data["email"] as? String ?? "",
                    photoURL: data["photoURL"] as? String ?? ""
                )
                
                if let photoURLString = data["photoURL"] as? String {
                    self.fetchUserPhoto(from: photoURLString)
                }
            }
        }
    }
    func fetchUserPhoto(from photoURLString: String) {
            let storageReference = Storage.storage().reference(forURL: photoURLString)
            storageReference.getData(maxSize: 2 * 1024 * 1024) { [weak self] data, error in
                guard let self = self else { return }

                if let error = error {
                    print("Error downloading image data: \(error.localizedDescription)")
                    return
                }
                if let imageData = data {
                    self.user?.photo = UIImage(data: imageData)
                }
            }
        }

    func updateProfile(name: String, email: String, bio: String, profileImageUrl: String) {
        guard let userID = user?.id else {
            return
        }
        
        Firestore.firestore().collection("users").document(userID).updateData([
            "displayName": name,
            "email": email,
            "bio": bio,
            "photoURL": profileImageUrl
        ]) { error in
            if let error = error {
                print("Error updating user data: \(error.localizedDescription)")
            }
        }
    }
    
    func uploadProfileImage(userID: String, image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        
        // Convert the image to Data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "EditProfileView", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
            return
        }

        // Create a unique filename for the image
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("ProfileImages/\(fileName).jpg")

        // Upload the image data
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                storageRef.downloadURL { (url, error) in
                    if let error = error {
                        completion(.failure(error))
                    } else if let downloadURL = url {
                        completion(.success(downloadURL.absoluteString))
                        
                    } else {
                        completion(.failure(NSError(domain: "EditProfileView", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])))
                    }
                }
            }
        }
    }

    
    deinit {
        listener?.remove()
    }
}
