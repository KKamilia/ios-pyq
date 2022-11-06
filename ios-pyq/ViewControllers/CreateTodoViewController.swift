//
//  File.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/5.
//

import UIKit

class CreateTodoViewController: UIViewController {
    @IBAction func addTodo(_sender:Any) {
        //Todo: pass content to main list
    }
    
    let inputBarText = "请输入"
    
    let confirmBtnTextColor = UIColor(red: 71/255, green: 161/255, blue: 173/255, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        inputLayout()
        confirmBtnLayout()
    }
    
    func inputLayout(){
        inputBar.text = inputBarText
        inputBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputBar.widthAnchor.constraint(equalTo:view.widthAnchor,multiplier:0.5)
        ])
    }
    
    func confirmBtnLayout(){
        let safeDistance = inputBar.frame.height + 10
        confirmBtn.frame = CGRect(x: view.frame.size.width/2 - inputBar.frame.width/8,
                                y: view.frame.height/2 + safeDistance,
                                width: inputBar.frame.width/2,
                                height:0)
    }
 
}
