//
//  SettingHorView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/10.
//

import SwiftUI

struct SettingHorView: View {
    
    let timer =
    Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    @State var currentIndex = 1
    
    let systemName = "gearshape"
    let setting = "设置"
    let settingTitle = "Setting Page"
    let backToTopBtn = "Back To top"
    
    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { reader in
                HStack {
                    Text(settingTitle)
                        .font(.title)
                    ForEach((1...40), id: \.self) { num in
                        HStack(spacing: 15) {
//                            Text("\(num)")
                            Image(systemName: systemName)
                            Text(setting)
                        }
                    }
                }
                .onAppear {
                    reader.scrollTo(1, anchor: .center)
                }
                .onReceive(timer) { time in
                    reader.scrollTo(currentIndex, anchor: .center)
                    
                }
            }
            
        }
    }
}

struct SettingHorView_Previews: PreviewProvider {
    static var previews: some View {
        SettingHorView()
    }
}
