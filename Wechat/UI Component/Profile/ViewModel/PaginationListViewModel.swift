//
//  PaginationView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/10.
//

import SwiftUI

// <T:input generic DataType>
struct PaginationListViewModel<T: Identifiable, Content: View>: View {
    
    let items: [T]
    @ViewBuilder let content: (T) -> Content
    
    var reload: (() -> Void)?
    var loadMoreAction: (() -> Void)?
    
    var body: some View {
        ForEach(items) { menu in
            content(menu)
        }
    }
    
    func reLoadable(action: @escaping () -> Void) -> Self {
        var copy = self
        copy.reload = action
        return copy
    }
    
    func loadable(action: @escaping () -> Void) -> Self {
        var copy = self
        copy.loadMoreAction = action
        return copy
    }
}

