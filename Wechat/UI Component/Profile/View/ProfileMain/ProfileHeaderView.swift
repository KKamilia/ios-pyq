//
//  ProfileHeaderView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

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

struct Me_List: View {
    
    var body: some View {
        Row()
    }
}

struct Menu: Identifiable {
    let id: String
    let iconName: String
    let title: String
}

struct Row: View {
    
    var menu: [Menu] = [
        Menu(id: "1", iconName: "message.and.waveform", title: "服务"),
        Menu(id: "2", iconName: "shippingbox", title: "收藏"),
        Menu(id: "3", iconName: "menucard", title: "卡包"),
        Menu(id: "4", iconName: "gearshape", title: "设置")
    ]
    
    var body: some View {
        VStack {
            List {
                Section {
                    ProfileHeaderView()
                }
                Section {
                    ForEach(menu) { menu in
                        HStack {
                            Image(systemName: "\(menu.iconName)")
                            Text("\(menu.title)")
                        }
                    }
                }
            }
        }
    }
    
    
    //    mutating func loadMore() {
    //        var newMenuItem = [
    //            Menu(id: "4", iconName: "gearshape", title: "设置")
    //        ]
    //        menu.append(contentsOf: newMenuItem)
    //    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Me_List()
    }
}


