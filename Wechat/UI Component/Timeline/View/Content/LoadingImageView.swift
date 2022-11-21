//
//  LoadingImageView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/20.
//

import SwiftUI

struct LoadingImageView: View {
  
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { i in
            i.image?.resizable()
        }
    }
}
