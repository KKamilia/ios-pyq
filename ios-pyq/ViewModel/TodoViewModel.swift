//
//  ListViewModel.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/7.
//

import Foundation
class TodoViewModel {
    
    func fetchList(list: [String] = StorageManager.getTodoList()) -> [String] {
        var todoList: [String] = [String]()
        for(index, item) in list.enumerated() {
            todoList.append("\(index+1). \(item)")
        }
        return todoList
    }
}
