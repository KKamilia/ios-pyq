//
//  HomeViewModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/16.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published private(set) var userModel: UserProfileModel = .init(avatar: "timeline_profile_image", nickname: "桃子猪", backgroundUrl: "timeline_profile_image_lu_photo1")
    
    func updateLoginedAvatarUrl(url: String) {
        userModel.avatar = url
    }
}

