//
//  StorageManager.swift
//  Todo
//
//  Created by Weidong Gu on 2022/7/26.
//

import Foundation

struct StorageManager {
    static let defaultStand = UserDefaults.standard
    static let TODO_LIST_KEY = "TODO_LIST_KEY"
    
    /// 获取所有 todo 数据
    /// - Returns: todo 字符串数组
    static func getTodoList() -> [String] {
        return defaultStand.stringArray(forKey: TODO_LIST_KEY) ?? []
    }
    
    /// 存储 Todo 条目
    /// - Parameter content: Todo 条目字符串
    static func saveTodoItem(content: String) {
        var todoList = defaultStand.stringArray(forKey: TODO_LIST_KEY) ?? []
        todoList.append(content)
        defaultStand.set(todoList, forKey: TODO_LIST_KEY)
    }
    
    static func removeInIndex(num: Int){
        var allList = getTodoList()
        allList.remove(at: num)
    }
    
    static func removeAll(){
        var allList = getTodoList()
        allList.removeAll(keepingCapacity: true)
    }
    
    static func removeAll2(){
        defaultStand.set([], forKey: TODO_LIST_KEY)
    }
}
