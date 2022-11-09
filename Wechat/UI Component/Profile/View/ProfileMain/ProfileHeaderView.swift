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
    func avaterModify() -> some View {
        modifier(AvatarModifier())
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("timeline_profile_image")
                .resizable()
                .avaterModify()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 62, height: 62)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("桃子猪")
                    .font(.title)
                Text("微信号:xxxxx")
                    .foregroundColor(Color.secondary)
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


