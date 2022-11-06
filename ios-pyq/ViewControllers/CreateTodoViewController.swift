//
//  File.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/5.
//

import UIKit

class CreateTodoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var confirmBtn: UIButton!
    
    
    let inputBarText = "请输入"
    
    let confirmBtnTextColor = UIColor(red: 71/255, green: 161/255, blue: 173/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputLayout()
        confirmBtnLayout()
    }
    
    func txtDelegate(){
        textField.becomeFirstResponder()
        textField.delegate = self
    }
    
    func inputLayout(){
        textField.placeholder = inputBarText
//        textField.keyboardTyp =
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalTo:view.widthAnchor,multiplier:0.5)
        ])
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect

        
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        
        // clear btn
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
    }
    
    func confirmBtnLayout(){
        let safeDistance = textField.frame.height + 10
        confirmBtn.frame = CGRect(x: view.frame.size.width/2 - textField.frame.width/8,
                                  y: view.frame.height/2 + safeDistance,
                                  width: textField.frame.width/2,
                                  height:0)
        confirmBtn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(confirmBtn)
    }
    //
    @objc
    func buttonClicked() {
        self.navigationController?.popToRootViewController(animated: true)
        
        // save data have not vaildate yet
//        let txtInput = textField.text!
//        StorageManager.saveTodoItem(content: txtInput)
    }
  
}
