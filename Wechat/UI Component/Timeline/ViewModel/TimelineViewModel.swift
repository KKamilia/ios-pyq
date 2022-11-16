//
//  TimelineViewModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import Foundation

class TimelineViewModel: ObservableObject {

    @Published var username: String
    @Published var nick: String
    @Published var avatar: String
    
    init(username: String, nick: String, avatar: String) {
        self.username = username
        self.nick = nick
        self.avatar = avatar
    }
}
