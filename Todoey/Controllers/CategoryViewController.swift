//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Spenser Courville-Taylor on 6/22/19.
//  Copyright © 2019 Spenser Courville-Taylor. All rights reserved.
//

import UIKit

import CoreData


class CategoryViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var categories = [Category]()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

      loadCategorys()
    }

    
    //Mark: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        let category = categories[indexPath.row]
        
            cell.textLabel?.text = category.name
        
        return cell
        
    }
    //Mark: - Data Manipulation Methods
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
           
            destinationVC.selectedCategory = categories[indexPath.row]
            
        }
        
    }
    
    
   
    
    
    
    
    
    
    //Mark: - Add New Catagories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        
        
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            
                newCategory.name = textFiled.text!
                newCategory.done = false
            
            self.categories.append(newCategory)
            
            self.saveCategorys()
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textFiled = alertTextField
            print(alertTextField.text)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    func saveCategorys() {
        
        do{
            try context.save()
    
        } catch {
            print("error saving context \(error)")
        }
            self.tableView.reloadData()
    }
    
    func loadCategorys(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        
        do{
            categories = try context.fetch(request)
        } catch {
            print("error finding data to context \(error)")
        }
        tableView.reloadData() 
    }
    
    
    //Mark: - TableView Delegate Methods
}
