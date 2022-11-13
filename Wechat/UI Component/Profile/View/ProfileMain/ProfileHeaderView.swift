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
    let avatar = "timeline_profile_image"
    let username = "桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪"
    let wechatId = "微信号:xxxxx"
    let signature = "个性签名:我是个性签名我是个性签名我是个性签名我是个性签名我是个性签名"
    let wechatIdColor = Color.secondary
    
    var body: some View {
        HStack {
            Image(avatar)
                .resizable()
                .avaterModify()
                .aspectRatio(contentMode: .fit)
                .frame(width: avatarWidth, height: avatarHeight)
            
            VStack(alignment: .leading) {
                Text(username)
                    .font(.headline)
                    .lineLimit(2)
                
                HStack {
                    Text(wechatId)
                        .foregroundColor(wechatIdColor)
                        .font(.subheadline)
                    HStack {
                        Text(signature)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                }
            }
            Spacer()
            Image("me_qrcode")
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
