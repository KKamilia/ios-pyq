//
//  CommentView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import SwiftUI

struct CommentView: View {
    // todo: init data in ViewModel
    var comments: [TimelineComment]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(comments) { comment in
                self.load(comment: comment)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
    }
    
    func load(comment: TimelineComment) -> Text {
        Text(comment.sender)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color("link")) +
        Text("：\(comment.content)")
            .font(.system(size: 14))
    }
}

