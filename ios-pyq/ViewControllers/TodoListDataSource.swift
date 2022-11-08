//
//  TableViewController2.swift
//  ios-pyq
//
//  Created by Qiqi Zhao on 2022/11/8.
//

import UIKit

extension TodoViewController: UITableViewDataSource {
    
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
