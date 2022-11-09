//
//  ProfileHeaderView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct AvatarModifier: ViewModifier {
    func body(content: Content) -> some
    View {
        content
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.red, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

extension Image {
    func avater() -> some View {
        modifier(AvatarModifier())
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("timeline_profile_image")
                .resizable()
                .avater()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(6)
                .frame(width: 62, height: 62)
            VStack(alignment: .leading){
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


