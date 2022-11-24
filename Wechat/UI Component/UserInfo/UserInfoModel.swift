//
//  UserInfoModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/24.
//

import Foundation

struct UserInfoModel: Decodable {
    let profileImage: String
    let avatar: String
    let nick: String
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case profileImage = "profile-iamge"
        case avatar
        case nick
        case username
    }
}




