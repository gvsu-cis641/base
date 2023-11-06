//
//  SwiftUIView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct ImageCarousel: View {
    var photos = ["photo", "photo", "photo"]
    
    var body: some View {
            TabView {
                ForEach(photos, id: \.self) { photo in
                    Image(systemName: photo)
                        .resizable()
                        .scaledToFit()
                }
            }
            .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    ImageCarousel()
}
