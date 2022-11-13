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
                Circle().stroke(.black,
                                lineWidth: 4)
            }
            .shadow(radius: 5)
    }
        
}

extension Image {
    func avatarModify () -> some View {
        modifier(AvatarModifier())
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("timeline_profile_image")
                .resizable()
                .avatarModify()
                .cornerRadius(20)
                .frame(width: 70, height: 70)
            VStack(alignment:.leading, spacing: 5) {
                Text("桃子猪")
                    .font(.title)
                Text("微信号:xxxxx")
                    .foregroundColor(Color.secondary)
                    .font(.subheadline)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 40, trailing: 200))
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}


