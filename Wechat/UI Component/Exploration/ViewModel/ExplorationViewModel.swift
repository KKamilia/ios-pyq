//
//  ExplorationViewModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import Foundation


class ExplorationViewModel: ObservableObject {
    @Published var explorationList: [ExplorationModel] = []
    
    init() {
        load()
    }
    
    func load() {
        explorationList.append(contentsOf:  [
            ExplorationModel(icon: "circle.circle.fill", title: "朋友圈"),
            ExplorationModel(icon: "gamecontroller.fill", title: "游戏"),
            ExplorationModel(icon: "link.circle", title: "小程序")
        ])
    }
}

