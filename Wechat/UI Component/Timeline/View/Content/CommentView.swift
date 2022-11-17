//
//  CommentView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import SwiftUI

struct CommentView: View {
 
    let name: String
    let content: String
    
    var body: some View {
        HStack {
            Text(name + ":")
                .font(.footnote)
                .foregroundColor(.blue)
            Text(content)
                .font(.footnote)
        }
    }
}

