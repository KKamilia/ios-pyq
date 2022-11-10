//
//  ProfileView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct ProfileView: View {
    
    var menu: [ProfileListItemModel] = [
        ProfileListItemModel(icon: "message.and.waveform", title: "服务"),
        ProfileListItemModel(icon: "shippingbox", title: "收藏"),
        ProfileListItemModel(icon: "menucard", title: "卡包"),
        ProfileListItemModel(icon: "gearshape", title: "设置")
    ]
    
    var body: some View {
        VStack {
            List {
                Section {
                    ProfileHeaderView()
                }
                Section {
                    PaginationListViewModel(items: menu) { menu in
                        HStack {
                            Image(systemName: menu.icon)
                            Text(menu.title)
                        }
                    }
                }
            }
        }
    }
    
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        }
    }
}
