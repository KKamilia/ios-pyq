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
    
    // Btn
    lazy var logoutBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = logoutBackgroundColor
        button.setTitle("退出登陆", for: .normal)
        button.layer.cornerRadius = 2
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            button.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        return button
    }()
    
    lazy var username: UILabel = {
        var label: UILabel = UILabel()
        label.text = usernameText
        label.textColor = usernameTextColor
        return label
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpUI()
        autoLayoutAvatar()
    }
    
    //todo: refactor -- layout
    func autoLayoutAvatar(){
        avatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            avatar.widthAnchor.constraint(equalTo:view.widthAnchor,multiplier:0.5)
        ])
        
        let usernameSafeDistance = avatar.frame.height + 20
        username.frame = CGRect(x: view.frame.size.width/2 - avatar.frame.width/8,
                                y: view.frame.height/2,
                                width: avatar.frame.width/2,
                                height:usernameSafeDistance)
    }
    
    func setUpUI(){
        view.addSubview(logoutBtn)
        view.addSubview(username)
    }
    
}
