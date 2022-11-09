//
//  ProfileRow.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/9.
//

import SwiftUI

struct ProfileRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                Text(title)
            }
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(icon: "icon_name", title: "title_name")
    }
}
