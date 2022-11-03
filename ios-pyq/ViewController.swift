//
//  ViewController.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/3.
//

import UIKit

class TodoViewController: UIViewController {
    
    @IBOutlet var plusBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class CreateTodoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class PersonalInfoViewController: UIViewController {
    
//    @IBOutlet var delBtn: UIButton!

    override func viewDidLoad() {

        super.viewDidLoad()
        let newBtn = UIButton()
        newBtn.setTitle("退出登陆x", for: .normal)
        self.view.addSubview(newBtn)
    }
    
    private func handleLogout(){

//        delBtn.frame =
//        self.view.addSubview(delBtn)
    }
}


