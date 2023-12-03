//
//  AuthenticationView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI
import FirebaseAuth

struct AuthenticationView: View {

    var user: User?
    
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
                    
                    Button("Login") {
                        login(email: username, password: password)
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
    
    func login(email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    print("success")
                }
            }
//            await authenticationState.login(
//                username: username,
//                password: password
//            )

    }
}

#Preview {
    AuthenticationView()
}
