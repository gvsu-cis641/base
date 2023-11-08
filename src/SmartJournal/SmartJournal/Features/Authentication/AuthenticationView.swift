//
//  AuthenticationView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct AuthenticationView: View {
    
<<<<<<< HEAD
    @State private var username = ""
    @State private var password = ""
    
    
    var body: some View {
        
        Text("Journal Log In")
            .font(.system(size:40))
            .fontWeight(.semibold)
        
        Text("Enter Name: ")
            .multilineTextAlignment(.leading)
        TextField("Username:", text: $username)
=======
    @State var username: String = String()
    @State var password: String = String()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Journal Log In")
                .font(.system(size:40))
                .fontWeight(.semibold)
            
            TextField("Username", text: $username)
                .modifier(TextFieldModifier())
            
            SecureField("Password", text: $password)
                .modifier(TextFieldModifier())
        }
        .padding()
    }
//    var body: some View {
//        
//        Text("Journal Log In")
//            .font(.system(size:40))
//            .fontWeight(.semibold)
//        
//        Text("Enter Name: ")
//            .multilineTextAlignment(.leading)
//        Text("Username: ")
//            .padding()
//            .background(
//                Color.gray
//                    .brightness(0.4)
//            )
//            .foregroundStyle(Color.black)
//            .multilineTextAlignment(.leading)
//            .frame(width: 426, height: 79)
//             
//        Text("Enter Password: ")
//            .multilineTextAlignment(.leading)
//        Text("Password: ")
//            .padding()
//            .background(
//                Color.gray
//                    .brightness(0.4)
//            )
//            .foregroundStyle(Color.black)
//            .multilineTextAlignment(.leading)
//            .frame(width: 426, height: 79)
//        
//        Text("Login:")
//            .multilineTextAlignment(.leading)
//        Text("Login")
//            .padding()
//            .background(
//                Color(red:0.0, green:71.0, blue:171.0)
//                    .brightness(-0.5))
//            .foregroundStyle(Color.white)
//            .multilineTextAlignment(.center)
//            .frame(width: 355, height: 129)
//        
//        Text("Forgot Username/password?")
//        
//        Text("Click Here")
//            .foregroundStyle(Color.blue)
//        
//        Text("Create Account")
//            .padding()
//            .background(
//                Color(red:0.0, green:71.0, blue:171.0)
//                    .brightness(-0.5))
//            .foregroundStyle(Color.white)
//            .multilineTextAlignment(.center)
//            .frame(width: 355, height: 96)
//    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
>>>>>>> f14b564afec235151bd78d545b74bdd0a6e7dd28
            .padding()
            .background(
                Color.gray
                .brightness(0.4)
            )
<<<<<<< HEAD
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.leading)
            .frame(width: 426, height: 79)
             
        Text("Enter Password: ")
            .multilineTextAlignment(.leading)
        TextField("Password: ", text: $password)
            .padding()
            .background(
                Color.gray
                    .brightness(0.4)
            )
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.leading)
            .frame(width: 426, height: 79)
        
        Text("Login:")
            .multilineTextAlignment(.leading)
        Text("Login")
            .padding()
            .background(
                Color(red:0.0, green:71.0, blue:171.0)
                    .brightness(-0.5))
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.center)
            .frame(width: 355, height: 129)
        
        Text("Forgot Username/password?")
        
        Text("Click Here")
            .foregroundStyle(Color.blue)
        
        Text("Create Account")
            .padding()
            .background(
                Color(red:0.0, green:71.0, blue:171.0)
                    .brightness(-0.5))
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.center)
            .frame(width: 355, height: 96)
=======
            .foregroundColor(.black)
            .cornerRadius(10)
>>>>>>> f14b564afec235151bd78d545b74bdd0a6e7dd28
    }
}

#Preview {
    AuthenticationView()
}
