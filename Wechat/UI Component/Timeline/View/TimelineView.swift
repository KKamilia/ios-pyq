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
    
    let alertText = "error"
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
            .alert(isPresented: $viewModel.presentAlert) {
                Alert(
                    title: Text("error"),
                    primaryButton: .destructive(Text("Try Again")) {
                        // resend request
                    },
                    secondaryButton: .cancel()
                )
            }
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
