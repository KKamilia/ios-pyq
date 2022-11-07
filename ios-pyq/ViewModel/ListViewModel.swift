//
//  ListViewModel.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/7.
//

import Foundation
class ListViewModel {
    
    func saveItem(_ input: String){
        StorageManager.saveTodoItem(content: input)
    }
    
    static func fetchList() -> [String] {
        let allList = StorageManager.getTodoList()
        var todoList: [String] = [String]()
        for(index, item) in allList.enumerated() {
            todoList.append("\(index+1). + \(item)")
        }
        return todoList
    }
}

