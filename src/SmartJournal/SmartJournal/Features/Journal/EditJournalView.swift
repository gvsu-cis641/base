//
//  EditJournalView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/15/23.
//

import SwiftUI

struct EditJournalView: View {
    @State private var text = String()
    
    var body: some View {
        NavigationStack() {
            VStack {
                VStack {
                    ImageCarousel()
                    
                    Button(action: uploadPhotos) {
                        Text("Upload Photos")
                    }
                    .buttonStyle(ActionButton())
                }
                
                VStack {
                    TextEditor(text: $text)
                        .border(.black)
                }
                
                .toolbar {
                    Button(action: navigateToAttributes) {
                        HStack (alignment: .top) {
                            Text("Next")
                            Image(systemName: "chevron.forward")
                        }
                    }
                }
            }
            .padding()
        }
    }
}

func uploadPhotos() {
    
}
        
func navigateToAttributes() {
    
}

#Preview {
    EditJournalView()
}
