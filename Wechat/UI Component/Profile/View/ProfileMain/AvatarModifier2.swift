//
//  AvatarModifier2.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/9.
//

import SwiftUI
struct AvatarModifier: ViewModifier {
    @State var lineWidth = CGFloat(4)
    @State var shadowRadius = CGFloat(7)
    
    func body(content: Content) -> some
    
    View {
        content
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.red, lineWidth: lineWidth)
            }
            .shadow(radius: shadowRadius)
            .animation(.default.repeatForever(), value: lineWidth)
            .onAppear{
                lineWidth = 2
                shadowRadius = 3
            }
    }
}

struct AvatarModifier2_Previews: PreviewProvider {
    static var previews: some View {
        AvatarModifier()
    }
}
