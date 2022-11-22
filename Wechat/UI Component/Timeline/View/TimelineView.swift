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
    let alertButtonText = "OK"
    
    var body: some View {
        List {
            TimeLineHeaderView(avatar: homeViewModel.userModel.avatar, username: homeViewModel.userModel.nickname)
            
            ForEach(viewModel.items) { i in
                TimelineContentItemView(model: i) {
                    viewModel.like(i)
                } commentCallback: {
                    viewModel.comment(i)
                }
            }
        }
        .onAppear{
            viewModel.loadData()
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentAlert) {
            Button(alertButtonText, role: .cancel) {}
        }
        .overlay {
            if viewModel.items.isEmpty {
                LoadingView(isHideLoader: false)
            } else {
                LoadingView(isHideLoader: true)
            }
        }
        .listStyle(.plain)
        .navigationBarTitle(navigationTitle)
    }
}
