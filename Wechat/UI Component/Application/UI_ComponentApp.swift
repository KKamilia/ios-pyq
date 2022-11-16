//
//  UI_ComponentApp.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

@main
struct Application: App {
   @StateObject var userProfileModel: UserProfileModel = UserProfileModel(avatar: "timeline_profile_image")
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(userProfileModel)
        }
    }
}
