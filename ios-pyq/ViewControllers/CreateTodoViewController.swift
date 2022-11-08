//
//  File.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/5.
//

import UIKit

class CreateTodoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    
    let createTodoViewModel = CreateTodoViewModel()
    
    
    let inputBarText = "请输入"
    
    let confirmBtnTextColor = UIColor(red: 71/255, green: 161/255, blue: 173/255, alpha: 1)
    let confirmBtnBackgroundColor = UIColor.systemBlue
    let confirmBtnTitleColor = UIColor(red: 0.00, green: 0.30, blue: 0.81, alpha: 1.00)
    
    lazy var confirmBtn: UIButton = {
        let button = UIButton()
        button.setTitle("确认", for: .normal)
        button.backgroundColor = confirmBtnBackgroundColor
        button.setTitleColor(confirmBtnTitleColor, for: .highlighted)
        view.addSubview(button)
        return button
    }()

    func confirmBtnLayout(){
        let safeDistance = textField.frame.height + 10
        confirmBtn.frame = CGRect(x: view.frame.size.width/2 - textField.frame.width/8,
                                  y: view.frame.height/2 + safeDistance,
                                  width: textField.frame.width/4,
                                  height:30)
        confirmBtn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldLayout()
        confirmBtnLayout()
    }
    
    func textFieldLayout(){
        textField.placeholder = inputBarText
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalTo:view.widthAnchor,multiplier:0.5)
        ])
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        // clear btn
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
    }
    
    @objc
    func buttonClicked() {
        if( textField.text != ""){
            createTodoViewModel.saveItem(input: textField.text ?? "")
            self.navigationController?.popToRootViewController(animated: true)
        }
    }  
}
