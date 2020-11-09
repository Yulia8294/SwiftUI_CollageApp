//
//  Spinner.swift
//  EmojiArts
//
//  Created by Yulia Novikova on 11/6/20.
//

import SwiftUI

struct Spinner: ViewModifier {
    
    @State var isVisible = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isVisible ? 360 : 0))
            .onAppear {
                self.isVisible = true
            }
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
    }
}

extension View {
    
    func spinning() -> some View {
        self.modifier(Spinner())
    }
}

