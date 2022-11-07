//
//  ViewController.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/3.
//
//

import UIKit

class TodoViewController: UIViewController {
    
    static let CustomCellIdentifier = "CustomCell"
    
    var todoItem = StorageManager.getTodoList()
    let tableView = UITableView()
    
    @IBOutlet var todoList: UITableView!
    @IBOutlet var plusBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView(){
        //        let tabBarHeight = tabBarController?.tabBar.frame.height ?? 0
        //        let tableviewHeight = view.frame.height - tabBarHeight
        //        tableView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: tableviewHeight)
        
        tableView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 600)
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TodoViewController.CustomCellIdentifier)
        
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        todoItem = StorageManager.getTodoList()
        tableView.reloadData()
        super.viewWillAppear(animated)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoViewController.CustomCellIdentifier)!
        
        cell.textLabel?.text = "\(indexPath.row+1). \(todoItem[indexPath.row])"
        
        return cell
    }
}
