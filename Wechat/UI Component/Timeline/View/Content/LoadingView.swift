//
//  LoadingView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/18.
//

import SwiftUI

struct LoadingView: View {
    @State var isHideLoader: Bool = true
    
    let tintColor = Color.red
    let scalSize = CGFloat(3.0)
    let padding = CGFloat(50)
    
    
    var body: some View {
        VStack {
            LoaderView(tintColor: tintColor, scalSize: scalSize)
                .padding(.bottom, padding)
                .hidden(isHideLoader)
        }
    }
}

struct LoaderView: View {
    var tintColor: Color = .red
    var scalSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scalSize,anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
