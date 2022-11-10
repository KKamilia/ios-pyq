//
//  ProfileHeaderView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI


struct ProfileHeaderView: View {
    
    let avatarWidth = CGFloat(62)
    let avatarHeight = CGFloat(62)
    let username = "桃子猪"
    let wechatId = "微信号:xxxxx"
    
    var body: some View {
        HStack {
            Image("timeline_profile_image")
                .resizable()
                .avaterModify()
                .aspectRatio(contentMode: .fit)
                .frame(width: avatarWidth, height: avatarHeight)
            
            VStack(alignment: .leading) {
                Text(username)
                    .font(.title)
                Text(wechatId)
                    .foregroundColor(Color.secondary)
                    .font(.subheadline)
            }
        }
    }
}

struct AvatarModifier: ViewModifier {
    @State var lineWidth = CGFloat(4)
    @State var shadowRadius = CGFloat(7)
    
    func body(content: Content) -> some View {
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

extension Image {
    func avaterModify() -> some View {
        modifier(AvatarModifier())
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
       ProfileHeaderView()
    }
}


