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
    
    let viewModel = TodoViewModel()
    
    //Question about init String
    
    // 1st method
    //    var todoItem : [String]
    //    init(todoItem: [String]) {
    //        self.todoItem = todoItem
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    // 2nd method
//    lazy var todoItem = viewModel.fetchList()
    
    var todoItem : [String] = []
    
    let tableView = UITableView()
    
    @IBOutlet var plusBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    //todo: table & cell move
    func configTableView() {
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
        todoItem = viewModel.fetchList()
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
}
