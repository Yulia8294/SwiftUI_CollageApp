//
//  EmojiPicker.swift
//  EmojiArts
//
//  Created by Yulia Novikova on 11/9/20.
//

import SwiftUI

struct EmojiPicker: View {
    
    @ObservedObject var document: EmojiArtDocument
    
    @Binding var choosenPalette: String
        
    var body: some View {
        HStack {
            Stepper(onIncrement: {
                choosenPalette = document.palette(after: choosenPalette)
            }, onDecrement: {
                choosenPalette = document.palette(before: choosenPalette)
            }, label: { EmptyView() })
            Text(document.paletteNames[choosenPalette] ?? "")
        }
        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
        .onAppear { choosenPalette = document.defaultPalette }
    }
}

struct EmojiPicker_Previews: PreviewProvider {
    static var previews: some View {
        EmojiPicker(document: EmojiArtDocument(), choosenPalette: Binding.constant(""))
    }
}
