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
    @State var callback: String = ""
    
    let navigationTitle = "Discovery"
    
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
        .overlay {
            if viewModel.items.isEmpty {
                LoadingView(isHideLoader: false)
            } else {
                LoadingView(isHideLoader: true)
            }
        }
        .onAppear{
            viewModel.restoreByUserDefault()
//            viewModel.loadWithAlamofire { string in
//                callback = string ?? ""
//            }
        }
        .refreshable {
            viewModel.storeDataToFileByUserDefaults()
        }
        .listStyle(.plain)
        .navigationBarTitle(navigationTitle)
    }
}
