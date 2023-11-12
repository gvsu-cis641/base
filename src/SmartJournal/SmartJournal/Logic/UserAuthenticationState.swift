//
//  UserAuthenticationState.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import Foundation

enum AuthenticationError: Error {
    case loginError, logoutError
}

@MainActor
class UserAuthenticationState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isBusy = false
    
    func login(username: String, password: String) async -> Result<Bool, AuthenticationError> {
        isBusy = true
        
        do {
            // TODO: Authenticate with backend
            try await Task.sleep(nanoseconds:  1_000_000_000)
            isLoggedIn = true
            isBusy = false
            
            return .success(true)
        } 
        
        catch {
            isBusy = false
            
            return .failure(.loginError)
        }
    }
    
    func logout() async -> Result<Bool, AuthenticationError> {
        // TODO: Try signing out in backend
        isBusy = true
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            isLoggedIn = false
            isBusy = false
            
            return .success(true)
        }
        
        catch {
            isBusy = false
            
            return .failure(.logoutError)
        }
    }
}
