//
//  CreateAccountView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import SwiftUI
import Foundation

struct CreateAccountView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var con_password = ""
    
    private let STACK_SPACING: CGFloat = 50
    
    var body: some View {
        NavigationStack {
            VStack (spacing: STACK_SPACING) {
                VStack{
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                VStack {
                    TextField("Email", text: $email)
                        .modifier(InputField())
                    
                    TextField("Username", text: $username)
                        .modifier(InputField())
                    
                    SecureField("Password", text: $password)
                        .modifier(InputField())
                    
                    SecureField("Confirm Password", text: $con_password)
                        .modifier(InputField())
                    
                    Button(action: {}) {
                        Text("Login")
                    }
                    .ActionButton(ButtonStyle())
                }
                
                VStack {
                    HStack{
                        Text("Click ")
                        
                        NavigationLink("Here") {
                            .AuthenticationView(View)
                                .foregroundStyle(Color.blue)
                        }
                        
                        Text(" to return to the login page")
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
