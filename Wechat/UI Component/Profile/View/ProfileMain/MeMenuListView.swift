//
//  MeMenuListView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/9.
//

import SwiftUI

struct MeMenuListView: View {
    
    struct Menu: Identifiable {
        let id: String
        let iconName: String
        let title: String
    }
//    struct Row: View {
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
    }
//}

struct MeMenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MeMenuListView()
    }
}
