//
//  CardBagView.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/14.
//

import SwiftUI

struct CardBagView: View {
    @State var cardNum: String = ""
    var body: some View {
        VStack {
            Text("当前的卡片号码: \(cardNum)")
                .font(.title)
            TextField("请输入卡号", text: $cardNum)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct CardBagView_Previews: PreviewProvider {
    static var previews: some View {
        CardBagView()
    }
}
