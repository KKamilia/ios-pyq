//
//  TimelineViewModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/17.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class TimelineViewModel: ObservableObject {
    
    @Published var items: [TimelineContentItemModel] = []
    @ObservedObject var service = TimelineService()
    @Published var presentAlert: Bool = false
    @Published var errorMessage: String = "nil"
    
    
    let itemsForCurrentValueSubject: CurrentValueSubject<[TimelineContentItemModel], TimelineServiceError> = .init([])
    let itemsForPassthroughSubject: PassthroughSubject<[TimelineContentItemModel], TimelineServiceError> = .init()
    
    
    
    private let url = URL(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets")!
    private let userDefaultKey = "ITEMS"
    private let pathComponant = "items"
    private let localPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    init() {
        loadData()
    }
    
    func loadData() {
        service.loadWithURLSessionPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.itemsForCurrentValueSubject.send(completion: completion)
                self?.itemsForPassthroughSubject.send(completion: completion)
                switch completion {
                case .finished:
                    self?.itemsForCurrentValueSubject.send(completion: completion)
                    self?.itemsForPassthroughSubject.send(completion: completion)
                    print("OK")
                case .failure(let error):
                    self?.errorMessage = error.description
                    self?.presentAlert = true
                }
            }, receiveValue: { [weak self] completion in
                self?.items = completion
                self?.itemsForPassthroughSubject.send(completion)
                self?.itemsForCurrentValueSubject.send(completion)
            })
            .store(in: &self.subscriptions)
        
    }
    
    
    func load() {
        items = [
            .init(id: 1, content: "（放弃）学习swift的第10天",
                  images: [.init(url: "Swift_icon")],
                  sender: .init(username: "桃子猪", nick: "桃子猪", avatar: "timeline_profile_image"),
                  comments: [.init(content: "66666666", sender: .init(username: "蜘蛛侠🕷️", nick: "蜘蛛侠🕷️", avatar: "me_qrcode"))],
                  likers: nil),
            .init(id: 2, content: "Happy workday",
                  images: [.init(url: "workday")],
                  sender: .init(username: "草莓熊", nick: "草莓熊🍓", avatar: "timeline_profile_image_tu"),
                  comments: nil,
                  likers: nil),
            .init(id: 3, content: "这是一条朋友圈",
                  images: [.init(url: "timeline_profile_image_lu_photo1")],
                  sender: .init(username: "桃子猪", nick: "桃子猪", avatar: "timeline_profile_image"),
                  comments: nil,
                  likers: nil),
            .init(id: 4, content: "今天brunch吃了啥？",
                  images: [.init(url: "brunch"), .init(url: "brunch2"), .init(url: "workday"), .init(url: "tower")],
                  sender: .init(username: "长颈鹿", nick: "长颈鹿", avatar: "timeline_profile_image_lu"),
                  comments: nil,
                  likers: ["草莓熊🍓"]),
            .init(id: 5, content: "懒懒的小猫咪",
                  images: [.init(url: "kitty1"),
                           .init(url: "kitty2")],
                  sender: .init(username: "长颈鹿", nick: "长颈鹿", avatar: "timeline_profile_image_lu"),
                  comments: nil,
                  likers: ["草莓熊🍓"])
        ]
    }
    
    func loadMoreData(_ item: TimelineContentItemModel) {
        if(items.last == item) {
            items.append(.init(id: 6,
                               content: "这是一条新的朋友圈",
                               images: [.init(url:  "workday")],
                               sender: .init(username: "美国队长",
                                             nick: "美国队长",
                                             avatar: "me_qrcode"),
                               comments: nil,
                               likers: nil))
        }
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
    
    func loadWithURLSession() {
        service.loadWithURLSession { item in
            self.items = item
        }
    }
    
    func loadWithAlamofire( ) {
        service.loadWithAlamofire { item in
            self.items = item
        }
    }
    
    func storeDataToFileByUserDefaults() {
        loadWithAlamofire()
        guard let data = try? PropertyListEncoder().encode(items)
        else { return }
        UserDefaults.standard.set(data, forKey: userDefaultKey)
    }
    
    func restoreByUserDefault() {
        // todo: merge guard let and remove else return
        guard let data = UserDefaults.standard.data(forKey: userDefaultKey)
        else { return }
        guard let item = try? PropertyListDecoder().decode([TimelineContentItemModel].self, from: data)
        else { return }
        items = item
    }
    
    func storeDateToFile() {
        DispatchQueue.global().async {
            AF.request(self.url).response { res in
                if let `data` = res.data {
                    guard let path = self.localPath.first?.appendingPathComponent(self.pathComponant)
                    else { return }
                    do { try? data.write(to: path) }
                }
            }
        }
    }
    
    func restoreDataFromFile() {
        // todo: merge guard let and remove else return
        guard let path = localPath.first?.appendingPathComponent(pathComponant)
        else { return }
        do {
            guard let item = try? Data(contentsOf: path) else { return }
            guard let i = try? JSONDecoder().decode([TimelineContentItemModel].self, from: item)
            else { return }
            items = i
        }
    }
}
