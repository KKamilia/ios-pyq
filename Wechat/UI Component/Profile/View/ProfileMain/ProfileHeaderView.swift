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

extension Image {
    func avaterModify() -> some View {
        modifier(AvatarModifier())
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("timeline_profile_image")
                .resizable()
                .avaterModify()
                .aspectRatio(contentMode: .fit)
                .frame(width: 62, height: 62)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("桃子猪")
                    .font(.title)
                Text("微信号:xxxxx")
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
    let icon: String
    let title: String
}

struct Row: View {
    let menu: [Menu] = [
        Menu(id: "1", icon: "message.and.waveform", title: "服务"),
        Menu(id: "2", icon: "shippingbox", title: "收藏"),
        Menu(id: "3", icon: "menucard", title: "卡包"),
        Menu(id: "4", icon: "gearshape", title: "设置")
    ]
    
    var body: some View {
        //        VStack {
        
        List {
            Section {
                ProfileHeaderView()
            }
            Section {
                List(menu) { menu in
                    HStack {
                        Image(systemName: "\(menu.icon)")
                        Text("\(menu.title)")
                    }
                }
            }
        }
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Me_List()
    }
}


