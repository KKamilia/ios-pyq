//
//  ProfileHeaderView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI


struct ProfileHeaderView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    let avatarWidth = CGFloat(62)
    let avatarHeight = CGFloat(62)
    let avatar = "timeline_profile_image"
    let qrCode = "me_qrcode"
    
    
    var body: some View {
        HStack {
            Image(avatar)
                .resizable()
                .avaterModify()
                .aspectRatio(contentMode: .fit)
                .frame(width: avatarWidth, height: avatarHeight)
            UserInfoView(username: $viewModel.username)
            Image(qrCode)
        }
    }
}

struct UserInfoView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass:
    UserInterfaceSizeClass?
    @State var orientation: UIDeviceOrientation = .unknown
    @Environment(\.scenePhase) var scenePhase: ScenePhase
    
    @Binding var username: String
    let wechatId = "微信号:xxxxxxxx"
    let signature = "个性签名:我是个性签名我是个性签名我是个性签名我是个性签名我是个性签名"
    let hobby = "个人爱好: 吃饭，睡觉，打豆豆"
    let wechatIdColor = Color.secondary
    let signatureColor = Color.orange
    
    var body: some View {
        VStack {
            if( orientation.isLandscape || horizontalSizeClass == .regular) {
                VStack(alignment: .leading) {
                    Text(username)
                        .font(.headline)
                        .lineLimit(2)
                        .onChange(of: scenePhase) { newValue in
                            username = ProfileViewModel().modifyUsername(newValue)
                        }
                    Text(wechatId)
                        .foregroundColor(wechatIdColor)
                        .font(.subheadline)
                    Text(signature)
                        .font(.subheadline)
                        .foregroundColor(signatureColor)
                        .lineLimit(1)
                    Text(hobby)
                        .foregroundColor(signatureColor)
                        .font(.subheadline)
                }
            }else {
                VStack {
                    Text(username)
                        .font(.headline)
                        .lineLimit(2)
                    HStack {
                        Text(wechatId)
                            .foregroundColor(wechatIdColor)
                            .font(.subheadline)
                            .layoutPriority(1)
                        Text(signature)
                            .font(.subheadline)
                            .foregroundColor(signatureColor)
                            .lineLimit(1)
                            .layoutPriority(0)
                    }
                }
            }
        }.onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

extension Image {
    func avaterModify() -> some View {
        modifier(AvatarModifier())
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) ->
    some View {
        modifier(RotateViewModifier(action: action))
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView().environment(\.horizontalSizeClass, .compact)
    }
}
