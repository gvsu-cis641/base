//
//  AuthenticationView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        
        Text("Journal Log In")
        
        Text("Enter Name: ")
            .multilineTextAlignment(.leading)
        Text("Username: ")
            .padding()
            .background(
                Color.gray
                    .brightness(0.4)
            )
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.leading)
             
        Text("Enter Password: ")
            .multilineTextAlignment(.leading)
        Text("Password: ")
            .padding()
            .background(
                Color.gray
                    .brightness(0.4)
            )
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.leading)
        
        Text("Login:")
            .multilineTextAlignment(.leading)
        Text("Login")
            .padding()
            .background(Color(red:0.0, green:71.0, blue:171.0))
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.center)
        
        Text("Forgot Username/password?")
        
        Text("Click Here")
            .foregroundStyle(Color.blue)
        
        Text("Create Account")
            .padding()
            .background(Color(red:0.0, green:71.0, blue:171.0))
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    AuthenticationView()
}
