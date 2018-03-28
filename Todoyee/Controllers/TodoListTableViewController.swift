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
    var itemArray = [Item]()
    //let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMethod()
        
    }
    
    //MARK:- User defined methods
    //MARK:-
    func initialMethod(){
        let newItem1 = Item()
        newItem1.title = "Find book"
        itemArray.append(newItem1)
        let newItem2 = Item()
        newItem2.title = "Find book"
        itemArray.append(newItem2)
        let newItem3 = Item()
        newItem3.title = "Find book"
        itemArray.append(newItem3)
//        if let items = defaults.array(forKey: "itemLists") as? [String]
//        {
//            itemArray = items
//        }
        
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
        cell.textLabel?.text = itemArray[indexPath.row].title
        
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
            let item = Item()
            item.title = textFeild.text!
            self.itemArray.append(item)
            //self.defaults.set(self.itemArray, forKey: "itemLists")
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

