//
//  SmartJournalApp.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

/** Learned how to use EnvironmentObjects to control authentication state here: https://paulallies.medium.com/login-logout-flow-swiftui-and-environmentobject-48ea084c5b6e */

import SwiftUI

@main
struct SmartJournalApp: App {
    
    @StateObject var authenticationState = UserAuthenticationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AuthenticationSwitcher()
            }
            .environmentObject(authenticationState)
        }
    }
}

struct AuthenticationSwitcher: View {
    @EnvironmentObject var authenticationState: UserAuthenticationState
    
    var body: some View {
        if (authenticationState.isLoggedIn) {
            HomeView()
        } else {
            AuthenticationView()
        }
    }
}
