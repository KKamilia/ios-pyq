//
//  ProfileView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @EnvironmentObject var userProfileModel: UserProfileModel
    @State var itemClick: String? = nil
    
    let load = "加载更多"
    let delete = "删除"
    let setting = "设置"
    let title = "我的"
    let collection = "收藏"
    let card = "卡包"
    let deleteBtnColor = Color.red
    let buttonColor = Color.black
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        NavigationLink {
                            EmptyView()
                        } label: {
                            ProfileHeaderView(viewModel: viewModel,
                                              username: viewModel.username,
                                              wechatId: viewModel.wechatId,
                                              signature: viewModel.signature,
                                              hobby: viewModel.hobby
                            )
                        }
                    }
                    Section {
                        PaginationListViewModel(items: viewModel.items) { item in
                            NavigationLink(tag: item.title, selection: $itemClick) {
                                switch (item.title) {
                                case setting:
                                    SettingsView()
                                case card:
                                    CardBagView()
                                case collection:
                                    SettingHorView()
                                default:
                                    EmptyView()
                                }
                            } label: {
                                HStack {
                                    Image(systemName: item.icon)
                                    Button(item.title) {
                                    }.foregroundColor(buttonColor)
                                }
                            }
                            .swipeActions {
                                Button(delete) {
                                    viewModel.deleteItem(id: item.id)
                                }.tint(deleteBtnColor)
                            }
                        }
                    }
                }
                Section {
                    Button(load) {
                        viewModel.loadMore()
                    }
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .refreshable {
            viewModel.refreshData()
            viewModel.reloadUser()
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
