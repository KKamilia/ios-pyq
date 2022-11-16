//
//  TimelineContentItemVIew.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import SwiftUI

struct TimelineContentItemVIew: View {
    // this is the main part of post
    @State private var footerRefreshing = false
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack(alignment: .top, spacing: 12) {
                    Image("timeline_profile_image_tu")
                        .resizable()
                        .frame(width: CGFloat(55.0), height: CGFloat(55.0))
                    VStack(alignment: .leading, spacing: 10) {
                        Text("username")
                            .bold()
                        Text("(放弃)学习Swift UI 第十天")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
//        RefreshFooter(refreshing: $footerRefreshing, action: loadMore) {
//                      Text(noMore ? "没有更多了" : "加载中...")
//                          .font(.system(size: 14, weight: .semibold))
//                          .foregroundColor(.secondary)
//                          .padding(.top, 6)
//                          .padding(.bottom, 20)
//                  }
       
    }
}

struct TimelineContentItemVIew_Previews: PreviewProvider {
    static var previews: some View {
        TimelineContentItemVIew()
    }
}
