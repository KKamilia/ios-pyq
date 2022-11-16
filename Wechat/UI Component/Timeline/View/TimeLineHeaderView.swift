//
//  TimeLineHeaderView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/16.
//

import SwiftUI

struct TimeLineHeaderView: View {
    
    let avatar: String
    let username: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("timeline_profile_background")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 400.0)
            HStack {
                Spacer()
                Text(username)
                    .foregroundColor(Color.white)
                Image(avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50.0)
            }
        }
    }
}

//struct TimeLineHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeLineHeaderView(homeViewModel: HomeViewModel())
//    }
//}
