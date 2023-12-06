//
//  UserAuthenticationState.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import Foundation
import Firebase

enum AuthenticationError: Error {
    case loginError, logoutError
}

@MainActor
class UserAuthenticationState: ObservableObject {
    @Published var isBusy = false
    
    @Published var isSignedIn: Bool = false
    @Published var user: User? = nil
        
        init() {
        
            Auth.auth().addStateDidChangeListener { (_, user) in
                self.isSignedIn = (user != nil)
                self.user = user
            }
        }
    
//    func login(username: String, password: String) async -> Result<Bool, AuthenticationError> {
//        isBusy = true
//            
//            // TODO: Authenticate with backend
//            if self.user != nil {
//                self.isSignedIn = true
//                isBusy = false
//                return .success(true)
//            } else {
//                isBusy = false
//                return .failure(.loginError)
//            }
//        
//    }
    
    func logout() async -> Result<Bool, AuthenticationError> {
        // TODO: Try signing out in backend
        isBusy = true
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.isSignedIn = false
            isBusy = false
            
            return .success(true)
        }
        
        catch {
            isBusy = false
            
            return .failure(.logoutError)
        }
    }
}
