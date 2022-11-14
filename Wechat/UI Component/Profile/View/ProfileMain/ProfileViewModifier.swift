//
//  AvatarModifier.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/10.
//

import SwiftUI

//Q: How to name the profile Modifier whne we have two modifiers in one file / how to arrange?
struct AvatarModifier: ViewModifier {
    
    @State var lineWidth = CGFloat(4)
    @State var shadowRadius = CGFloat(7)
    
    let shadowColor = Color.orange
    
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay {
                Circle().stroke(shadowColor, lineWidth: lineWidth)
            }
            .shadow(radius: shadowRadius)
            .animation(.default.repeatForever(), value: lineWidth)
            .onAppear{
                lineWidth = 2
                shadowRadius = 3
            }
    }
}

struct RotateViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content.onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) {_ in
            action(UIDevice.current.orientation)
        }
    }
}
