//
//  TimeLineHeaderView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/16.
//

import SwiftUI

struct TimeLineHeaderView: View {
    
    let backgroundImageFrame = CGFloat(400.0)
    let avatarFrame = CGFloat(70.0)
    let avatarXOffSet = CGFloat(-20.0)
    let avatarYOffSet = CGFloat(10.0)
    let avatarRadius = CGFloat(3)
    
    let avatar: String
    let username: String
    var backgroundImage = "timeline_profile_background"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(backgroundImage)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: backgroundImageFrame)
            HStack {
                Spacer()
                Text(username)
                    .foregroundColor(Color.white)
                    .bold()
                Image(avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: avatarFrame, height: avatarFrame)
                    .cornerRadius(avatarRadius)
            }
            .offset(x: avatarXOffSet, y: avatarYOffSet)
        }
    }
}

struct TimeLineHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineHeaderView(avatar: "timeline_profile_image", username: "username")
    }
}
