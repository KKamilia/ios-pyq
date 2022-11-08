//
//  CreateTodoViewModel.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/8.
//

import Foundation
class CreateTodoViewModel {
    
    func saveItem(input: String) {
        StorageManager.saveTodoItem(content: input)
    }
}
