//
//  MomentModel.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/16.
//

import SwiftUI

struct MomentModel: Identifiable, Equatable {
    var id = UUID()
    var text: String?
    var comment: String
    var like: Bool
    
}
