//
//  ProfileView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        VStack {
            List {
                Section {
                    ProfileHeaderView()
                }
                Section {
                    PaginationListViewModel(items: viewModel.menus) { menu in
                        HStack {
                            Image(systemName: menu.icon)
                            Text(menu.title)
                        }
                    }
                }
                Section {
                    Button("click") {
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
