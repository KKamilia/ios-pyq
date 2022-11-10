//
//  ProfileView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = MenuViewModel()
    let btnTitle = "加载更多"
    let delete = "删除"
    
    var body: some View {
        VStack {
            List {
                Section {
                    ProfileHeaderView()
                }
                Section {
                    PaginationListViewModel(items: viewModel.items) { item in
                        HStack {
                            Image(systemName: item.icon)
                            Text(item.title)
                        }
                        .swipeActions {
                            Button(delete) {
//                                viewModel.deleteItem()
                            }
                            .tint(.red)
                        }
                    }
                }
                Section {
                    Button(btnTitle) {
                        viewModel.loadMore()
                    }
                }
            }
            .onAppear{
                viewModel.reload()
            }
            .refreshable {
                viewModel.refreshData()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
