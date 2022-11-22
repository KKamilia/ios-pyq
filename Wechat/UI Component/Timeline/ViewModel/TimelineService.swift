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
    
    private let url = URL(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets")!
    
    func loadWithURLSession(completion: @escaping ([TimelineContentItemModel]) -> ()) {
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
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
        let decoder = JSONDecoder()
        
        AF.request(url).response { res in
            if let `data` = res.data {
                let result: [TimelineContentItemModel] = try! decoder.decode([TimelineContentItemModel].self, from: data)
                completion(result)
            } else { return }
        }
    }
    
    func loadWithURLSessionPublisher() -> AnyPublisher<[TimelineContentItemModel], TimelineServiceError> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [TimelineContentItemModel].self, decoder: JSONDecoder())
            .mapError { error -> TimelineServiceError in
                switch error {
                case is URLError:
                    return .invaildUrl(error)
                case is DecodingError:
                    return .decodeFailed
                default:
                    return .unknown
                }
            }
            .eraseToAnyPublisher()
    }
    
}

enum TimelineServiceError: Error {
    case decodeFailed
    case invaildUrl(Error)
    case unknown
    
    var description: String {
        switch self {
        case .decodeFailed:
            return "数据解码失败"
        case .invaildUrl(let error):
            return "服务相应错误:\(error.localizedDescription)"
        case .unknown:
            return "未知错误"
        }
    }
}
