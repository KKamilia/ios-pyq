//
//  ProfileItemModel.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import Foundation

struct ProfileListItemModel: Identifiable, Equatable {
    var id =  UUID()
    let icon: String
    let title: String
}
