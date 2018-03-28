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
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        print(filePath)
        initialMethod()
        
    }
    
    //MARK:- User defined methods
    //MARK:-
    func initialMethod(){
        loadItems()
        
    }
    //MARK:- Saving Data Items
    func saveItems(){
        //Encoding data
        let encoder = PropertyListEncoder()
        do{
            let data =  try encoder.encode(self.itemArray)
            try data.write(to: self.filePath!)
        }
        catch{
            print("Error encoding itemArray \(error)")
        }
        tableView.reloadData()
    }
    func loadItems(){
        if let data = try? Data(contentsOf: filePath!){
            let decoder = PropertyListDecoder()
            do{
                itemArray = try decoder.decode([Item].self, from: data)
                
            }catch{
                print("Error decoding \(error)")
            }
        }
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
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark:.none
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- ACTIONS
    //MARK:-
    
    @IBAction func btnAddNewItemTapped(_ sender: Any) {
        var textFeild = UITextField()
        let alert = UIAlertController.init(title: "Add New Todoyee Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Add Item", style: .default) { (action) in
            //What will happen into this
            let newItem = Item()
            newItem.title = textFeild.text!
            self.itemArray.append(newItem)
            self.saveItems()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textFeild = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

