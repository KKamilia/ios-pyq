//
//  TimelineView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct TimelineView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView {
            TimeLineHeaderView(avatar: homeViewModel.userModel.avatar, username: homeViewModel.userModel.nickname)
            TimelineContentItemVIew()
        }
       
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
