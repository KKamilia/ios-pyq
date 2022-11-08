//
//  ListViewModel.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/7.
//

import Foundation
class TodoViewModel {
    
    func fetchList() -> [String] {
        
        let allList = StorageManager.getTodoList()
        var todoList: [String] = [String]()
        
        for(index, item) in allList.enumerated() {
            todoList.append("\(index+1). \(item)")
        }
        return todoList
    }
}
