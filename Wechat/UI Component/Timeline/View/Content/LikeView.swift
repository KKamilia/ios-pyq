//
//  LikeView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//


import SwiftUI

struct LikeView: View {
    
    let iconName = "heart"
    let seperator = ", "
    let likers: [String]
    let offsetY = CGFloat(5)
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .offset(y: offsetY)
                .foregroundColor(.black)
            ForEach(likers, id: \.self) { i in
                if (likers.count > 1) {
                    Text(seperator + "\(i)")
                        .foregroundColor(.black)
                }else {
                    Text(i)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView(likers: ["钢铁侠"])
    }
}
