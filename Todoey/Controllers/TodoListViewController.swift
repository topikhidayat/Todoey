//
//  ViewController.swift
//  Todoey
//
//  Created by Topik Hidayat on 2/18/18.
//  Copyright © 2018 Topik Hidayat. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    //var itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon" ]
    var todoeyItems:[Item] = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.defaults.set(self.todoeyItems, forKey: "TodoListArray")
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            //itemArray = items
            for i in items {
                todoeyItems.append(Item(name:i))
            }
        }
    }

    //MARK - Tablview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoeyItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell" , for: indexPath)
        
        let item = todoeyItems[indexPath.row]
        cell.textLabel?.text = item.name
        
        cell.accessoryType = item.checked ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        //tableView.cellForRow(at: indexPath)?.accessoryType = tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ? .none : .checkmark


//        // solution 1
//        if let cel = tableView.cellForRow(at: indexPath) {
//            cel.accessoryType = cel.accessoryType == .checkmark ? .none : .checkmark
//            todoeyItems[indexPath.row].checked = cel.accessoryType == .checkmark
//        }
        
        // solution 2
        let item = todoeyItems[indexPath.row]
        item.checked = !item.checked
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField();
        
        let alert = UIAlertController(title: "Add New Todoey OItem", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                // what will happen once the user clicks the Add Item button on our UIAlert
            self.todoeyItems.append(Item(name:textField.text!))
            
                //self.defaults.set(self.todoeyItems, forKey: "TodoListArray")
                self.tableView.reloadData()
            }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

