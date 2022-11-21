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
        AsyncImage(url: URL(string: imageURL)) { phase in
            if let image = phase.image {
                image.resizable() 
            } else {
                ProgressView()
            }
        }
    }
}
