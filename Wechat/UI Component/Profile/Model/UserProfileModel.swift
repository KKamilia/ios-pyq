//
//  UserProfileModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/16.
//

import Foundation

@MainActor class UserProfileModel: ObservableObject {
    @Published var avatar: String
    
    init (avatar: String) {
        self.avatar = avatar
    }
}
