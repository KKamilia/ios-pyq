//
//  SettingHorView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/10.
//

import SwiftUI

struct SettingHorView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var currentIndex = 1
    
    @Environment(\.scenePhase) var scenePhase: ScenePhase
    @State var blurRadius: CGFloat = 0
    
    let initIndex = 1
    let systemName = "gearshape"
    let setting = "设置"
    let title = "Setting Page"
    
    
    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { reader in
                HStack {
                    Text(title)
                        .font(.title)
                    ForEach((1...40), id: \.self) { num in
                        HStack(spacing: 15) {
                            Text("\(num)")
                            Image(systemName: systemName)
                            Text(setting)
                        }
                    }
                }
                .onAppear {
                    reader.scrollTo(initIndex, anchor: .center)
                }
                .onReceive(timer) { time in
                    currentIndex += 1
                    withAnimation {
                        reader.scrollTo(currentIndex, anchor: .center)
                    }
                }
                
            }
            .blur(radius: blurRadius)
            .onChange(of: scenePhase, perform: { state in
                switch state {
                case .active:
                    withAnimation{ blurRadius = 0 }
                case .inactive:
                    withAnimation{ blurRadius = 15 }
                case .background:
                    blurRadius = 20
                @unknown default: blurRadius = 0
                }
            })
        }
    }
}

struct SettingHorView_Previews: PreviewProvider {
    static var previews: some View {
        SettingHorView()
    }
}
