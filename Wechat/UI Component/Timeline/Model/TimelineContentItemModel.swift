//
//  TimelineContentItemModel.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/10/29.
//

import Foundation

struct TimelineContentItemModel: Identifiable, Equatable, Codable {
    var id: Int 
    let content: String?
    let images: [TimelineImage]?
    let sender: TimelineSender?
    var comments: [TimelineComment]?
    var likers: [String]?
    
    init(
        id: Int,
        content: String?,
        images: [TimelineImage]?,
        sender: TimelineSender?,
        comments: [TimelineComment]?,
        likers: [String]?) {
            self.id = id
            self.content = content
            self.images = images
            self.sender = sender
            self.comments = comments
            self.likers = likers
        }
}

struct TimelineImage: Identifiable, Equatable, Codable {
    let url: String
    var id: String { url }
}

struct TimelineSender: Equatable, Codable {
    let username: String
    let nick: String
    let avatar: String
}

struct TimelineComment: Identifiable, Equatable, Codable {
    let content: String
    let sender: TimelineSender
    
    var id: String {
        content + sender.username
    }
}
