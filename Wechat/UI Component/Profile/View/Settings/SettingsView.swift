//
//  SettingsView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import SwiftUI

struct SettingsView: View {
    @State private var presentAlert = false
    
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
        .alert("欢迎进入设置页面~", isPresented: $presentAlert) {
        }
        .onAppear {
            presentAlert = true
            print("Setting page appear")
        }.onDisappear {
            print("Setting page disappear")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
