//
//  ProfileHeaderView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("timeline_profile_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(6)
                .frame(width: 62, height: 62)
            VStack {
                Text("桃子猪")
                    .font(.headline)
                Text("微信号:xxxxx")
                    .font(.subheadline)
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}


