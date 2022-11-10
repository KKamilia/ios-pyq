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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
