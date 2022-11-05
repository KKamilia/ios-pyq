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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TodoViewController.CustomCellIdentifier)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoViewController.CustomCellIdentifier)!
        
        
        cell.textLabel?.text = "\(indexPath.row+1). \(todoItem[indexPath.row])"
        
        return cell
    }
}


