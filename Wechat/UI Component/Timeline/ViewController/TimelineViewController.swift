//
//  TimelineViewController.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/23.
//

import Foundation
import SwiftUI
import UIKit
import Combine

class TimelineViewController: UIViewController {
    
    @ObservedObject private var viewModel = TimelineViewModel()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    var items: [TimelineContentItemModel] = []
    let itemView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeRequest()
        configTextView()
    }
    
    func subscribeRequest() {
        viewModel
            .itemsForCurrentValueSubject
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
            }, receiveValue: { value in
            })
            .store(in: &subscriptions)
        
        viewModel
            .itemsForPassthroughSubject
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("OK")
                case .failure(let error):
                    self?.showErrorMessage(error.description)
                    print(completion)
                }
            }, receiveValue: { [weak self] value in
                self?.itemView.text = value.toJSONString()
            })
            .store(in: &subscriptions)
    }
    
    func configTextView() {
        itemView.frame = view.bounds
        view.addSubview(itemView)
    }
    
    func showErrorMessage(_ errorMessage: String) {
        itemView.frame = view.bounds
        itemView.textColor = .red
        itemView.text = errorMessage
    }
}

public extension Encodable {
    func toJSONString() -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(self) else{ return "" }
        guard let jsonStr = String(data: data, encoding: .utf8) else{ return "" }
        return jsonStr
    }
}

