//
//  ViewController.swift
//  Todo
//
//  Created by Ari Zaman on 7/9/18.
//  Copyright © 2018 Ari Zaman. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Shower"
        itemArray.append(newItem)
        
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //our cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell 
        
    }

    //Mark - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       /* if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark { //adding checkmark
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        */

        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true) //flashing grey
        
    }
    
    //MARK - Add new items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert //alert
        )
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in  //button pressed
            //once the user clicks the add item button on our ui alert
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem) //adding user text to array
            
            self.tableView.reloadData() //repopulating table
        }
        
        alert.addTextField { (alertTextField) in //add text box
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

