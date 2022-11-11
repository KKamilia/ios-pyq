//
//  MenuViewModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/10.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    
    @Published var items: [ProfileListItemModel] = []
    
    func reload() {
        items.removeAll()
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
}
