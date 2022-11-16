//
//  ProfileAvatarModificationView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/16.
//

import SwiftUI

struct ProfileAvatarModificationView: View {
    @EnvironmentObject private var homeviewModel: HomeViewModel
    @State var showEdit = false
    
    let editAvatar = "修改头像"
    let buttonName = "ellipsis"
    let more = "更多"
    
    var body: some View {
        VStack {
            Image(homeviewModel.userModel.avatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .navigationTitle(editAvatar)
        .toolbar {
            Button {
                showEdit = true
            } label: {
                Image(systemName: buttonName)
            }
            .actionSheet(isPresented: $showEdit) {
                ActionSheet(title: Text(more), buttons: [.default(Text("修改头像")) {
                    homeviewModel.updateLoginedAvatarUrl(url: "timeline_profile_image_lu")
                }, .cancel()])
            }
        }
    }
}

struct ProfileAvatarModificationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAvatarModificationView()
    }
}
