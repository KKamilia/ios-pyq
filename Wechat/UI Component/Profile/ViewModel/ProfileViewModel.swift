//
//  MenuViewModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/10.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var items: [ProfileListItemModel] = []
    @Published var username = """
            猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪\
            桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪\
            桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪
            """
    @Published var wechatId = "微信号:xxxxxxxx"
    @Published var signature = "个性签名:我是个性签名我是个性签名我是个性签名我是个性签名我是个性签名"
    @Published var hobby = "个人爱好: 吃饭，睡觉，打豆豆"
    
    init() {
        reload()
    }
    
    private func reload() {
        items.append(contentsOf: [
            ProfileListItemModel(id: UUID(), icon: "message.and.waveform", title: "服务"),
            ProfileListItemModel(id: UUID(), icon: "shippingbox", title: "收藏"),
            ProfileListItemModel(id: UUID(), icon: "menucard", title: "卡包"),
            ProfileListItemModel(id: UUID(), icon: "gearshape", title: "设置")
        ])
    }
    
    func loadMore() {
        items.append(contentsOf: [
            ProfileListItemModel(id: UUID(), icon: "car", title: "Didi"),
            ProfileListItemModel(id: UUID(), icon: "face.smiling", title: "表情")
        ])
    }
    
    func refreshData() {
        items.append(contentsOf: [
            ProfileListItemModel(id: UUID(), icon: "arrow.clockwise.circle", title: "数据已刷新")
        ])
    }
    func clear() {
        items.removeAll()
    }
    
    func deleteItem(id: UUID) {
        items = items.filter({ item in
            item.id != id
        })
    }
    
    func modifyUsername(_ newValue: ScenePhase) -> String {
        switch newValue {
        case .active:
            username = """
            猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪\
            桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪\
            桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪桃子猪
            """
        default:
            username = "保密"
            print(username)
        }
        return username
    }
    
    func reloadUser() {
        wechatId = "6666666"
        signature = "6666666"
        hobby = "6666666"
    }
}
