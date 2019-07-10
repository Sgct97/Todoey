//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Spenser Courville-Taylor on 6/22/19.
//  Copyright © 2019 Spenser Courville-Taylor. All rights reserved.
//

import UIKit

import RealmSwift

import ChameleonFramework


class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categories : Results<Category>?
    


    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

      loadCategories()
    
        tableView.separatorStyle = .none
       
    }

    
    //Mark: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! SwipeTableViewCell
        
       cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        
        cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].color ?? "1D9BF6")
//        cell.delegate = self
        
        
        return cell
        
    }
    //Mark: - Data Manipulation Methods
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
           
            destinationVC.selectedCategory = categories?[indexPath.row]
            
        }
        
    }
    
    
   
    
    
    
    
    
    
    //Mark: - Add New Catagories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        
        
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let newCategory = Category()
            
                newCategory.name = textFiled.text!
                newCategory.color = UIColor.randomFlat.hexValue()
//
            
            
            
            self.save(category: newCategory)
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textFiled = alertTextField
            print(alertTextField.text)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    func save(category: Category) {
        
        do{
            try realm.write {
                realm.add(category)
            }
    
        } catch {
            print("error saving context \(error)")
        }
            self.tableView.reloadData()
    }
    
    func loadCategories() {
            categories = realm.objects(Category.self)
   
    }

    
    override func updateModel(at indexPath: IndexPath) {
        super.updateModel(at: indexPath)
        
        if let categoryForDeletion = self.categories? [indexPath.row] {
            do{
                try self.realm.write {
                    try self.realm.delete([categoryForDeletion])
                }
            }catch{
                print("Can not delete, \(error)")
            }

        }
    }
    
//
    
    //Mark: - TableView Delegate Methods
}

//Mark: - Swipe cell delegate methods


    
    

