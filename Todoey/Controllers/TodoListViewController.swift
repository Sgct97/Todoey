//
//  ViewController.swift
//  Todoey
//
//  Created by Spenser Courville-Taylor on 6/15/19.
//  Copyright © 2019 Spenser Courville-Taylor. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let itemArray = defaults.array(forKey: "TodoListArray") as? [Item] {
            self.itemArray = itemArray
        }
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Do Dishes"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find jerry"
        itemArray.append(newItem3)
        

           itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
         itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)

    
         
            
        
        
        
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
      tableView.reloadData()
     
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // Mark - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text)
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    }
    


