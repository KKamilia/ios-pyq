//
//  ProfileHeaderView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI


struct ProfileHeaderView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    let avatarWidth = CGFloat(62)
    let avatarHeight = CGFloat(62)
    let avatar = "timeline_profile_image"
    let qrCode = "me_qrcode"
    let wechatId: String
    let signature: String
    let hobby: String

    var body: some View {
        HStack {
            Image(avatar)
                .resizable()
                .avaterModify()
                .aspectRatio(contentMode: .fit)
                .frame(width: avatarWidth, height: avatarHeight)
            UserInfoView(username: $viewModel.username,
                         wechatId: viewModel.wechatId,
                         signature: viewModel.signature,
                         hobby: viewModel.hobby)
            Image(qrCode)
        }
    }
}

struct UserInfoView: View {
    @StateObject var viewModel = ProfileViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass:
    UserInterfaceSizeClass?
    @State var orientation: UIDeviceOrientation = .unknown
    @Environment(\.scenePhase) var scenePhase: ScenePhase

    @Binding var username: String
    let wechatId: String
    let signature: String
    let hobby: String
    
    let wechatIdColor = Color.secondary
    let signatureColor = Color.orange
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(username)
                    .font(.headline)
                    .lineLimit(2)
                    .onChange(of: scenePhase) { newValue in
                        username = viewModel.modifyUsername(newValue)
                    }

                if(orientation.isLandscape || horizontalSizeClass == .regular) {
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
                }else {
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
