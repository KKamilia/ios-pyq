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
    private var viewModel = TodoViewModel()
    
    var todoItem = TodoViewModel.fetchList()
    let tableView = UITableView()
    
    @IBOutlet var plusBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    //todo: table & cell move
    func configTableView(){
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TodoViewController.CustomCellIdentifier)
        
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        todoItem = TodoViewModel.fetchList()
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
}
