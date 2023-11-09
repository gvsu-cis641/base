//
//  CustomButton.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/9/23.
//

import SwiftUI

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        
    }
}
