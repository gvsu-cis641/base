//
//  HomeView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI


struct HomeView: View {
    private let posts = [PostView(), PostView()]
    var body: some View {
        ScrollView {
            ForEach(posts, id: \.self) { post in
                post
            }
        }
    }
}

#Preview {
    HomeView()
}
