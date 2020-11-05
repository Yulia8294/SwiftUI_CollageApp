//
//  OptionalImage.swift
//  EmojiArts
//
//  Created by Yulia Novikova on 11/6/20.
//


import SwiftUI

struct OptionalImage: View {
    
    var image: UIImage?
    
    var body: some View {
        if let image = image {
            Image(uiImage: image).resizable()
        }
    }
}

