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
    
    @IBOutlet var todoList: UITableView!
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
        
        // Todo: move to viewModel
        todoItem = TodoViewModel.fetchList()
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
        
        cell.textLabel?.text = "\(todoItem[indexPath.row])"
        
        return cell
    }
}
