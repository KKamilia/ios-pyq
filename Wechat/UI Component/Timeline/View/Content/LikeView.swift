//
//  LikeView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import SwiftUI

struct LikeView: View {
    
    //todo: inject liker into here
    let likers: [String] = ["like", "zhuzhuzhu"]
    let heart = "heart"
    let iconFrame = CGFloat(12.0)
    let iconOffset = CGFloat(5.0)
    let topAndBottom = CGFloat(4.0)
    let leadingAndtrailing = CGFloat(141.0)
    let space = "    "
    let comma = ", "
    let likerTextSize = CGFloat(14)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            showLikers()
                .fixedSize(horizontal: false, vertical: true)
            Image(systemName: heart)
                .resizable()
                .frame(width: iconFrame, height: iconFrame)
                .offset(y: iconOffset)
        }
        .padding(.init(top: topAndBottom,
                       leading: leadingAndtrailing,
                       bottom: leadingAndtrailing,
                       trailing: topAndBottom))
    }
    
    func showLikers() -> Text {
        // add some space for "heart"
        var text = Text(space)
        
        for (i, liker) in likers.enumerated() {
            if i > 0 { text = text + Text(comma)
            }
            text = text + Text(liker)
                .font(.system(size: likerTextSize,
                              weight: .medium))
                .foregroundColor(Color.black)
        }
        return text
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
