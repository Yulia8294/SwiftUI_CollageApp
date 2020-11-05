//
//  EmojiArtsApp.swift
//  EmojiArts
//
//  Created by Yulia Novikova on 11/5/20.
//

import SwiftUI

@main
struct EmojiArtsApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
