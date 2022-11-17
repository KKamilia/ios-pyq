//
//  TimelineView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct TimelineView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @ObservedObject var viewModel = TimelineViewModel()
    
    var body: some View {
       List {
            TimeLineHeaderView(avatar: homeViewModel.userModel.avatar, username: homeViewModel.userModel.nickname)
            
            ForEach(viewModel.items) { i in
                TimelineContentItemView(model: i) {
                    viewModel.like(i)
                } commentCallback: {
                    viewModel.comment(i)
                }
                .onAppear{
                    viewModel.loadMoreData(i)
                }
            }
        }
        .listStyle(.plain)
        .navigationBarTitle("Discovery")
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
