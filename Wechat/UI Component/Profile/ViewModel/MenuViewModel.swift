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
            ProfileListItemModel(icon: "message.and.waveform", title: "服务"),
            ProfileListItemModel(icon: "shippingbox", title: "收藏"),
            ProfileListItemModel(icon: "menucard", title: "卡包"),
            ProfileListItemModel(icon: "gearshape", title: "设置")
        ])
    }
    
    func loadMore() {
        items.append(contentsOf: [
            ProfileListItemModel(icon: "car", title: "Didi"),
            ProfileListItemModel(icon: "face.smiling", title: "表情")
        ])
    }
    
    func refreshData() {
        items.append(contentsOf: [
            ProfileListItemModel(icon: "arrow.clockwise.circle", title: "数据已刷新")
        ])
    }
    func clear() {
        items.removeAll()
    }

//    func deleteItem(title: String = [] ) {
//       items = items.filter
//    }
}
