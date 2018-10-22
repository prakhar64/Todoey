//
//  ViewController.swift
//  Todoey
//
//  Created by Prakhar Srivastava on 21/10/18.
//  Copyright © 2018 Prakhar Srivastava. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Eleven", "Twelve", "Thirteen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        print(indexPath.row)
        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark}
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var itemTextField = UITextField()
        
        let addItemAlert = UIAlertController(title: "Add new item", message: "Enter the item you want to add", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) in
            // what should happen once the user clicks 'Add' in the UIAlert
            
            self.itemArray.append(itemTextField.text!)
            
            self.tableView.reloadData()
        }
            
        addItemAlert.addTextField { (itemAlertTextField) in
            itemAlertTextField.placeholder = "Enter item details"
            itemTextField = itemAlertTextField
            
        }
            
        addItemAlert.addAction(addAction)
        
        present(addItemAlert, animated: true, completion: nil)
        
    }
    
    
}

