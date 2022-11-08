//
//  TodoViewModelTest.swift
//  ios-pyqTests
//
//  Created by Qiqi Zhao on 2022/11/8.
//

import XCTest
@testable import ios_pyq

class TodoViewModelTest: XCTestCase {
    func testFetchTodoListWhenTodoItemIsNotEmpty() throws {
        // given
        StorageManager.removeAll2()
        let todoViewModel = TodoViewModel()
        let createTodoViewModel = CreateTodoViewModel()

        var excepted : [String] = []
        let item1 = "1. 晨练"
        let item2 = "2. 背单词"
        excepted.append(item1)
        excepted.append(item2)
        
        createTodoViewModel.saveItem(input: "晨练")
        createTodoViewModel.saveItem(input: "背单词")
        
        // when
        
        let result = todoViewModel.fetchList()
        
        // then
        XCTAssertEqual(result, excepted)
    }
    
}
