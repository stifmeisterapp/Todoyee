//
//  ViewController.swift
//  Todoyee
//
//  Created by Callsoft on 28/03/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    //MARK:- VARIABLES
    var itemArray = ["Find a book","Read current related chapter","Make Notes"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK:- Data Soucrce Delegates of TableView
    //MARK:-
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- ACTIONS
    //MARK:-
    
    @IBAction func btnAddNewItemTapped(_ sender: Any) {
        var textFeild = UITextField()
        let alert = UIAlertController.init(title: "Add New Todoyee Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Add Item", style: .default) { (action) in
            //What will happen into this
            self.itemArray.append(textFeild.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textFeild = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

