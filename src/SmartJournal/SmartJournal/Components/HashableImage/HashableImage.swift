//
//  File.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import Foundation
import SwiftUI

struct HashableImage: Hashable {
    let id = UUID()
    var image: Image = Image(systemName: "photo")
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
