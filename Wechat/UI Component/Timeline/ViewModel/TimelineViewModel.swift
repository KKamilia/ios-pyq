//
//  TimelineViewModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import Foundation

class TimelineViewModel: ObservableObject {
    
    @Published var items: [TimelineContentItemModel] = []
    
    init() {
        load()
    }
    
    private func load() {
        items = [
            .init(content: "（放弃）学习swift的第10天",
                  images: [.init(url: "Swift_icon")],
                  sender: .init(username: "桃子猪", nick: "桃子猪", avatar: "timeline_profile_image"),
                  comments: [.init(content: "66666666", sender: .init(username: "蜘蛛侠🕷️", nick: "蜘蛛侠🕷️", avatar: "me_qrcode"))],
                  likers: nil),
            .init(content: "Happy workday",
                  images: [.init(url: "workday")],
                  sender: .init(username: "草莓熊", nick: "草莓熊🍓", avatar: "timeline_profile_image_tu"),
                  comments: nil,
                  likers: nil),
            .init(content: "这是一条朋友圈",
                  images: [.init(url: "timeline_profile_image_lu_photo1")],
                  sender: .init(username: "桃子猪", nick: "桃子猪", avatar: "timeline_profile_image"),
                  comments: nil,
                  likers: nil),
            .init(content: "今天brunch吃了啥？",
                  images: [.init(url: "brunch"), .init(url: "brunch2"), .init(url: "workday"), .init(url: "tower")],
                  sender: .init(username: "长颈鹿", nick: "长颈鹿", avatar: "timeline_profile_image_lu"),
                  comments: nil,
                  likers: ["草莓熊🍓"]),
            .init(content: "懒懒的小猫咪",
                  images: [.init(url: "kitty1"),
                           .init(url: "kitty2")],
                  sender: .init(username: "长颈鹿", nick: "长颈鹿", avatar: "timeline_profile_image_lu"),
                  comments: nil,
                  likers: ["草莓熊🍓"])
        ]
    }
    
    func loadMoreData(_ item: TimelineContentItemModel) {
        items.append(.init(content: "这是一条新的朋友圈",
                           images: [.init(url:  "workday")],
                           sender: .init(username: "美国队长",
                                         nick: "美国队长",
                                         avatar: "me_qrcode")))
        items.append(.init(content: "这是一条新的朋友圈2",
                           images: [.init(url:  "workday")],
                           sender: .init(username: "美国队长",
                                         nick: "美国队长",
                                         avatar: "me_qrcode")))
        
    }
    
    func like(_ item: TimelineContentItemModel) {
        var newItem = item
        var newLikers = Array(item.likers ?? [])
        
        newLikers.append("钢铁侠")
        newItem.likers = newLikers
        
        if let index = items.firstIndex(where: { $0 == item }) {
            items[index] = newItem
        }
    }
    
    func comment(_ item: TimelineContentItemModel) {
        var newItem = item
        var newComment = Array(item.comments ?? [])
        
        newComment.append(.init(content: "这是一条评论",
                                sender: .init(username: "桃子猪🍑", nick: "桃子猪🍑", avatar: "timeline_profile_image")))
        newItem.comments = newComment
        
        if let index = items.firstIndex(where: { $0 == item }) {
            items[index] = newItem
        }
    }
}
