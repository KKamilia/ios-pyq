//
//  ExplorationView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct ExplorationView: View {
    @StateObject var viewModel = ExplorationViewModel()
    
    let iconSpace = CGFloat(20)
    let iconColor = Color.blue
    let iconName: [String] = ["circle.circle.fill"]
    let moment = "朋友圈"
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.explorationList) { i in
                    NavigationLink {
                        switch (i.title) {
                        case moment:
                            MomentsView()
                        default:
                            EmptyView()
                        }
                    } label: {
                        HStack(spacing: iconSpace) {
                            Image(systemName:i.icon)
                                .foregroundColor(iconColor)
                                .frame(alignment: .leading)
                            Text(i.title)
                        }
                    }
                }
            }
        }
    }
}

class ExplorationViewModel: ObservableObject {
    @Published var explorationList: [ExplorationModel] = []
    
    init() {
        reload()
    }
    
    func reload() {
        explorationList.append(contentsOf:  [
            ExplorationModel(icon: "circle.circle.fill", title: "朋友圈"),
            ExplorationModel(icon: "gamecontroller.fill", title: "游戏"),
            ExplorationModel(icon: "link.circle", title: "小程序")
        ])
    }
}

struct ExplorationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorationView()
    }
}
