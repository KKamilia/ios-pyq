//
//  ImageView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import SwiftUI

struct ImageView: View {
    
    let image : [TimelineImage]
    let picFrame = CGFloat(200)
    let multipleImageSize: CGSize = CGSize(width: 90, height: 90)
    
    var body: some View {
        // todo: frame of iamge
        if image.count == 1 {
            LoadingImageView(imageURL: image.first?.url ?? "")
                .scaledToFit()
                .frame(maxWidth: picFrame)
        }else {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                
                ForEach(image) { image in
                    LoadingImageView(imageURL:image.url)
                        .scaledToFit()
                        .frame(width: multipleImageSize.width, height: multipleImageSize.height)
                        .clipped()
                }
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: [.init(url: "brunch")])
    }
}
