////
////  MeMenuListView.swift
////  UI Component
////
////  Created by Qiqi Zhao on 2022/11/9.
////
//
//import SwiftUI
//
//struct MeMenuListView: View {
//
//    let menu: [MenuViewModel]
//    var body: some View {
//        VStack {
//            Section {
//                ForEach(menu) { item in
//                    HStack {
//                        Image(systemName: item.iconName)
//                        Text(item.title)
//                    }
//                }
//            }
//        }
//    }
//}
//
//// todo change the type of viewModel
////struct MenuViewModel: View {
////    struct Menu: Identifiable {
////        let id: String
////        let iconName: String
////        let title: String
////    }
////    var body: some View {
////        var menuModel: [Menu] = [
////            Menu(id: "1", iconName: "message.and.waveform", title: "服务"),
////            Menu(id: "2", iconName: "shippingbox", title: "收藏"),
////            Menu(id: "3", iconName: "menucard", title: "卡包"),
////            Menu(id: "4", iconName: "gearshape", title: "设置")
////        ]
////    }
////}
//
//class ViewModel: ObservedObject {
//    Menu: Identifiable {
//            let id: String
//            let iconName: String
//            let title: String
//        }
//    @Published var menu: [Menu] = []
//
//    func loadMenu() {
//        menu.append(contentsOf: [
//            Menu(id: "1", iconName: "message.and.waveform", title: "服务"),
//            Menu(id: "2", iconName: "shippingbox", title: "收藏"),
//            Menu(id: "3", iconName: "menucard", title: "卡包"),
//            Menu(id: "4", iconName: "gearshape", title: "设置")
//        ])
//    }
//
//
//}
//
//struct MeMenuListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MeMenuListView()
//    }
//}
