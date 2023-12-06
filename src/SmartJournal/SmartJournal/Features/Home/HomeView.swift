//
//  HomeView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI
import FirebaseAuth



struct HomeView: View {
    private let posts = [PostView(), PostView()]
    var body: some View {
        NavigationStack {
        ScrollView {
            VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                NavigationLink("Profile") {
//                    ProfileView(userId: Auth.auth().currentUser?.uid ?? "ajksbd")
                    ProfileView()
                }
                .buttonStyle(ActionButton())
                Spacer()
                Button("Logout") {
                    do { try Auth.auth().signOut() }
                        catch { print("already logged out") }
                }
                ForEach(posts, id: \.self) { post in
                    post
                }
                
            }
        )}
    }
}
}

#Preview {
    HomeView()
}
