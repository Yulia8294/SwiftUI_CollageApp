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
    @Binding var isShowing: Bool
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Palette Editor").font(.headline).padding()
                HStack {
                    Spacer()
                    Button("Done") {
                        isShowing = false
                    }
                }
            }
            Divider()
            
            Form {
                Section {
                    TextField("Palette Name", text: $paletteName) { began in
                        if !began {
                            document.renamePalette(chosenPalette, to: paletteName)
                        }
                    }
                    
                    TextField("Add Emoji", text: $emojisToAdd) { began in
                        if !began {
                            chosenPalette = document.addEmoji(emojisToAdd, toPalette: chosenPalette)
                            emojisToAdd = ""
                        }
                    }
                }
                
                Section(header: Text("Remove emoji")) {
                    Grid(chosenPalette.map { String($0) }, id: \.self) { emoji in
                        Text(emoji).font(Font.system(size: fontSize))
                            .onTapGesture {
                                chosenPalette = document.removeEmoji(emoji, fromPalette: chosenPalette)
                            }
                    }.frame(height: self.height)
                }
            }
        }
        
        .onAppear {
            paletteName = document.paletteNames[chosenPalette] ?? ""
        }
    }
    
    var height: CGFloat {
        CGFloat((chosenPalette.count - 1 / 6) * 70 + 70)
    }
    
    let fontSize: CGFloat = 40
}

struct PaletteEditor_Previews: PreviewProvider {
    static var previews: some View {
        PaletteEditor(chosenPalette: Binding.constant(""), isShowing: Binding.constant(false))
       
    }
}
