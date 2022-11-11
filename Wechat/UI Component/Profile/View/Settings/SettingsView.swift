//
//  SettingsView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import SwiftUI

struct SettingsView: View {
    
    let systemName = "gearshape"
    let setting = "设置"
    let settingTitle = "Setting Page"
    let backToTopBtn = "Back To top"
    let titleId = "titleId"
    
    var body: some View {
        ScrollView(.vertical) {
            ScrollViewReader { reader in
                Text(settingTitle)
                    .font(.title)
                    .id(titleId)
                ForEach((1...40), id: \.self) { num in
                    HStack {
                        Text("\(num)")
                        Image(systemName: systemName)
                        Text(setting)
                    }
                }
                Button(backToTopBtn) {
                    withAnimation {
                        reader.scrollTo(titleId, anchor: .top)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
