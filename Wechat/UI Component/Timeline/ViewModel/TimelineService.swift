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

struct Repository: Codable {
    let items: [TimelineContentItemModel]?
}

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
//    
//    func loadWithURLSessionPublisher() -> AnyPublisher<[TimelineContentItemModel], TimelineServiceError> {
//        return Future { promise in
//            promise(result)
//        }.eraseToAnyPublisher()
//    }
    
    
}



