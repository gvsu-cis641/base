//
//  CustomButton.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/9/23.
//

import SwiftUI

struct ActionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.actionButton)
            .foregroundColor(.white)
            .cornerRadius(10)
        
    }
}
