//
//  TimelineViewControllerRepresentable.swift
//  UI Component
//
//  Created by Qiqi Zhao on 2022/11/23.
//

import SwiftUI
import UIKit

struct TimelineViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = TimelineViewController
    
    func makeUIViewController(context: Context) -> TimelineViewController {
        let viewController = TimelineViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: TimelineViewController, context: Context) {
        
    }
}

struct TimelineViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        TimelineViewControllerRepresentable()
    }
}
