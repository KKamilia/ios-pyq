//
//  TimelineContentItemModel.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/10/29.
//

import Foundation

struct TimelineContentItemModel: Identifiable, Equatable {
    let content: String?
    let images: [TimelineImage]?
    let sender: TimelineSender?
    var comments: [TimelineComment]?
    var likers: [String]?
    
    var id: String {
        (content ?? "") + (sender?.username ?? "")
    }
}

struct TimelineImage: Identifiable, Equatable {
    let url: String
    var id: String { url }
}

struct TimelineSender: Equatable {
    let username: String
    let nick: String
    let avatar: String
}

struct TimelineComment: Identifiable, Equatable {
    let content: String
    let sender: TimelineSender
    
    var id: String {
        content + sender.username
    }
}
