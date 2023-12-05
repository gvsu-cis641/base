//
//  CreateAccountView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountView: View {

    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var con_password = ""

    private let STACK_SPACING: CGFloat = 50

    var body: some View {
        NavigationStack {
            VStack (spacing: STACK_SPACING) {
                Text("Create Account")
                    .font(.title)
                    .fontWeight(.semibold)

                VStack {
                    TextField("Email", text: $email)
                        .modifier(InputField())

                    TextField("Username", text: $username)
                        .modifier(InputField())

                    SecureField("Password", text: $password)
                        .modifier(InputField())

                    SecureField("Confirm Password", text: $con_password)
                        .modifier(InputField())

                    Button("Create Account") {
                        createAccount(email: email, password: password, username: "demo", confirm_password: con_password)
                    }
                    .buttonStyle(ActionButton())
                }
                .padding()
            }
        }
    }
    
    private func createAccount(email: String, password: String, username: String, confirm_password: String) {
            let firebaseManager = FirebaseManager.shared

            firebaseManager.createAccountAndAddUser(email: email, username: username, password: password, con_password: confirm_password) { result in
                switch result {
                case .success(let userProfile):
                    print("User registered successfully: \(userProfile.displayName)")
                    // Handle success, such as navigating to the next screen
                case .failure(let error):
                    print("Error signing up: \(error.localizedDescription)")
                    // Handle the error, such as displaying an alert to the user
                }
            }
        }
}

#Preview {
    CreateAccountView()
}
