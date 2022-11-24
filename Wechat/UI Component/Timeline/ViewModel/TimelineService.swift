//
//  TimelineService.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/21.
//

import SwiftUI
import Combine
import UIKit
import Alamofire

class TimelineService: ObservableObject {
    private let url = "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets"
    private let userInfoUrl = "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith"
    func loadWithURLSession(completion: @escaping ([TimelineContentItemModel]) -> ()) {
        guard let urlPath = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: urlPath) {data, _, error in
            DispatchQueue.main.async {
                if let `data` = data {
                    let result = try! JSONDecoder().decode([TimelineContentItemModel].self, from: data)
                    completion(result)
                } else { return }
            }
        }
        task.resume()
    }
    
    func loadWithAlamofire(completion: @escaping ([TimelineContentItemModel]) -> ()) {
        if let urlPath = URL(string: url) {
            AF.request(urlPath).response { res in
                if let `data` = res.data {
                    let result: [TimelineContentItemModel] = try! JSONDecoder().decode([TimelineContentItemModel].self, from: data)
                    completion(result)
                } else { return }
            }
        } else { return }
    }
    
    func loadWithURLSessionPublisher() -> AnyPublisher<[TimelineContentItemModel], TimelineServiceError> {
        guard let urlPath = URL(string: url) else {
            return Fail(error: TimelineServiceError.invaildUrl)
                .eraseToAnyPublisher()
        }
        return URLSession
            .shared
            .dataTaskPublisher(for: urlPath)
            .map(\.data)
            .decode(type: [TimelineContentItemModel].self, decoder: JSONDecoder())
            .mapError { error in
                return TimelineServiceError.serverDisconncet(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func loadUserInfo() -> AnyPublisher<UserInfoModel, TimelineServiceError> {
        guard let url = URL(string: userInfoUrl) else {
            return Fail(error: TimelineServiceError.invaildUrl)
                .eraseToAnyPublisher()
        }
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UserInfoModel.self, decoder: JSONDecoder())
            .mapError{ error in
                return TimelineServiceError.serverDisconncet(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum TimelineServiceError: Error {
    case invaildUrl
    case serverDisconncet(Error)
    
    var description: String {
        switch self {
        case .invaildUrl:
            return "无效URL路径"
        case .serverDisconncet(let error):
            return "服务相应错误:\(error.localizedDescription)"
        }
    }
}
