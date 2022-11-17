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
                .foregroundColor(.blue)
                Text(joinLikers(likers: likers))
                .foregroundColor(.blue)
        }
    }
    
    func joinLikers(likers: [String]) -> String{
        let newLikers: String = likers.joined(separator: seperator)
        return newLikers
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView(likers: ["钢铁侠"])
    }
}
