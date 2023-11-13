//
//  AuthenticationView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct AuthenticationView: View {

    @EnvironmentObject var authenticationState: UserAuthenticationState
    @State private var username = ""
    @State private var password = ""
    
    private let STACK_SPACING: CGFloat = 50
 
    var body: some View {
        NavigationStack {
            VStack (spacing: STACK_SPACING) {
                VStack{
                    Text("Smart Journal")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Image(systemName: "book")
                        .font(.system(size:100))
                }
                
                VStack {
                    TextField("Username", text: $username)
                        .modifier(InputField())
                    
                    SecureField("Password", text: $password)
                        .modifier(InputField())
                    
                    Button(action: login) {
                        Text("Login")
                    }
                    NavigationLink("Login") {
                        HomeView()
                    }
                    .buttonStyle(ActionButton())
                }
                
                VStack {
                    Text("Forgot Username/password?")
                    Button(action: {}) {
                        Text("Click Here")
                            .foregroundStyle(Color.blue)
                    }
                    
                    NavigationLink("Create Account") {
                        CreateAccountView()
                    }
                    .buttonStyle(ActionButton())
                }
            }
            .padding()
        }
    }
    
    func login() {
        Task {
            await authenticationState.login(
                username: username,
                password: password
            )
        }
    }
}

#Preview {
    AuthenticationView()
}
