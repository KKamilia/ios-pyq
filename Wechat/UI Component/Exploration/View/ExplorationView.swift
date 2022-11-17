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
    let moment = "朋友圈"
    let title = "Discovery"
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.explorationList) { i in
                    NavigationLink {
                        switch (i.title) {
                        case moment:
                           TimelineView()
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
            }.navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }.navigationViewStyle(.stack)
    }
}

struct ExplorationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorationView()
    }
}
