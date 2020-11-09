//
//  PaletteEditor.swift
//  EmojiArts
//
//  Created by Yulia Novikova on 11/9/20.
//

import SwiftUI

struct PaletteEditor: View {
    
    @EnvironmentObject var document: EmojiArtDocument
    
    @Binding var chosenPalette: String
    @State private var paletteName: String = ""
    @State private var emojisToAdd: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Palette Editor").font(.headline).padding()
            Divider()
            
            TextField("Palette Name", text: $paletteName, onEditingChanged: { began in
                if !began {
                    document.renamePalette(chosenPalette, to: paletteName)
                }
            }).padding()
            
            TextField("Add Emoji", text: $emojisToAdd, onEditingChanged: { began in
                if !began {
                    chosenPalette = document.addEmoji(emojisToAdd, toPalette: chosenPalette)
                    emojisToAdd = ""
                }
            }).padding()
            
            Spacer()
        }
        .onAppear {
            paletteName = document.paletteNames[chosenPalette] ?? ""
        }
    }
}

struct PaletteEditor_Previews: PreviewProvider {
    static var previews: some View {
        PaletteEditor(chosenPalette: Binding.constant(""))
       
    }
}
