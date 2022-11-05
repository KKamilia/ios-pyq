//
//  ViewController.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/3.
//

import UIKit

class TodoViewController: UIViewController {
    
    //todo: add datasource automatically
    let todoItem:[String] = ["Study", "Work","Sleep","Play"]
    
    @IBOutlet var todoList: UITableView!
    @IBOutlet var plusBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
    }
    
    func configTableView(){
        let tableView = UITableView()
        tableView.frame = CGRect(origin: .zero, size:view.frame.size)
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = self
        
    }
    
}
extension TodoViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        
        cell.textLabel?.text = "\(indexPath.row+1). \(todoItem[indexPath.row])"
        
        return cell
    }
}


class CreateTodoViewController: UIViewController {
    @IBAction func addTodo(_sender:Any) {
        //Todo: pass content to main list
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


class PersonalInfoViewController: UIViewController {
    
    @IBOutlet var avatar: UIImageView!
    
    let logoutBackgroundColor = UIColor(red: 71/255, green: 161/255, blue: 173/255, alpha: 1)
    
    lazy var logoutBtn: UIButton = {
        let buttonX = 16.0
        let buttonHeight = 48.0
        let buttonY = view.frame.height - buttonHeight - 16.0 - view.safeAreaInsets.bottom
        let buttonWidth = view.frame.width - 16 * 2
        let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight))
        button.backgroundColor = logoutBackgroundColor
        button.setTitle("退出登陆", for: .normal)
        button.layer.cornerRadius = 1.5

        return button
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        super.viewWillLayoutSubviews()
        setUpUI()
        autoLayoutAvatar()
    }
    
    func autoLayoutAvatar(){
        avatar.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    avatar.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier:0.8)
                ])
    }
    
    func setUpUI(){
        view.addSubview(logoutBtn)
    }
    
}
