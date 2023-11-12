//
//  CustomText.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/9/23.
//

import SwiftUI

struct CustomTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .padding()
            .accentColor(.black)
            .background(Color.lightGray)
            .border(Color.lightGray)
            .cornerRadius(10)
            .padding(.bottom)
    }
}
