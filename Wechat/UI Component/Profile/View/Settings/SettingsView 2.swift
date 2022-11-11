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
    
    var body: some View {
        ScrollView(.vertical) {
                Text(settingTitle)
                    .font(.title)
                ForEach((1...40), id: \.self) { i in
                    HStack {
                        Text("\(i)")
                        Image(systemName: systemName)
                        Text(setting)
                    }
                }
//            .Button(backToTopBtn) {
//                backToTop()
//            }
        }
        
    }
//    func backToTop() {
//
//    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
