//
//  TimelineContentView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import SwiftUI

struct TimelineContentView: View {
    let items: [TimelineContentItemModel]
    let likeCallback: (TimelineContentItemModel) -> Void
    let commentCallback: (TimelineContentItemModel) -> Void
    
    var body: some View {
        VStack {
            ForEach(items) { i in
                TimelineContentItemView(model: i) {
                    likeCallback(i)
                } commentCallback: {
                    commentCallback(i)
                }
            }
        }
    }
}

