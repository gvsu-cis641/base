//
//  File.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import Foundation
import SwiftUI

struct HashableUIImage: Hashable, View {
    let id = UUID()
    var uiImage: UIImage = UIImage(systemName: "photo")!
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var body: some View {
        Image(uiImage: uiImage)
    }
    
}
