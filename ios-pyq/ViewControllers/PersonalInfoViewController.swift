//
//  PersonalInfoViewController.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/5.
//

import UIKit
class PersonalInfoViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet var avatar: UIImageView!
    
    private let usernameText = "何猪猪"
    
    // color
    let logoutBackgroundColor = UIColor(red: 71/255, green: 161/255, blue: 173/255, alpha: 1)
    let usernameTextColor = UIColor(red: 0.00, green: 0.30, blue: 0.81, alpha: 1.00)
    
    lazy var logoutBtn: UIButton = {
        let buttonX = 16.0
        let buttonHeight = 48.0
        let navigateBar = tabBarController!.tabBar.frame.size.height
        let buttonY = view.frame.height - buttonHeight - 16.0 - view.safeAreaInsets.bottom - navigateBar
        let buttonWidth = view.frame.width - 16 * 2
        let button = UIButton(frame: CGRect(x: buttonX,
                                            y: buttonY,
                                            width: buttonWidth,
                                            height: buttonHeight))
        button.backgroundColor = logoutBackgroundColor
        button.setTitle("退出登陆", for: .normal)
        button.layer.cornerRadius = 1.5
        
        return button
    }()
    
    lazy var username: UILabel = {
        var label: UILabel = UILabel()
        label.text = usernameText
        label.textColor = usernameTextColor
        return label
    }()
    
    override func viewDidLoad() {
        
        //        super.viewDidLoad()
        super.viewWillLayoutSubviews()
        setUpUI()
        autoLayoutAvatar()
        view.addSubview(username)
    }
    
    //todo: refactor
    func autoLayoutAvatar(){
        avatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            avatar.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier:0.8)
        ])
        
        let usernameSafeDistance = avatar.frame.height + 20
        username.frame = CGRect(x: view.frame.size.width/2,
                                y: view.frame.height/2,
                                width: avatar.frame.width,
                                height:usernameSafeDistance)
    }
    
    func setUpUI(){
        view.addSubview(logoutBtn)
    }
    
}
