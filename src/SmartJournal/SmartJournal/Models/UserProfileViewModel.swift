import SwiftUI
import Firebase

struct UserProfile {
    var id: String
    var displayName: String
    var bio: String
    var email: String
    // Add other properties as needed
}

class UserProfileViewModel: ObservableObject {
    @Published var user: UserProfile?
    private var listener: ListenerRegistration?
    
    init() {
        // Fetch information about the current user when the view model is initialized
        fetchCurrentUserData()
    }

    func fetchCurrentUserData() {
        guard let currentUser = Auth.auth().currentUser else {
            // Handle the case where the user is not authenticated
            return
        }
        
        let userID = currentUser.uid
        
        // Set up a snapshot listener to update the user data in real-time
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
            // Handle the case where the user ID is not available
            return
        }
        
        // Update user data in Firebase
        // Again, customize this based on your Firebase setup
        Firestore.firestore().collection("users").document(userID).updateData([
            "displayName": name,
            "email": email,
            "bio": bio
        ]) { error in
            if let error = error {
                print("Error updating user data: \(error.localizedDescription)")
            } else {
                // Update successful, you might want to perform additional actions
            }
        }
    }
    
    deinit {
        // Stop the listener when the view model is deinitialized
        listener?.remove()
    }
}
