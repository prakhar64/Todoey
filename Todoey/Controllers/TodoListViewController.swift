//
//  ViewController.swift
//  Todoey
//
//  Created by Prakhar Srivastava on 21/10/18.
//  Copyright © 2018 Prakhar Srivastava. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

//    var itemArray = ["Eleven", "Twelve", "Thirteen"]

    var itemArray = [Item]()
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if let items = userDefaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
        
        let newItem0 = Item()
        newItem0.itemTitle = "Eleven"
        newItem0.isDone = false
        itemArray.append(newItem0)
        
        let newItem1 = Item()
        newItem1.itemTitle = "Twelve"
        newItem1.isDone = false
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.itemTitle = "Thirteen"
        newItem2.isDone = false
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.itemTitle = "First"
        newItem3.isDone = false
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.itemTitle = "Seventh"
        newItem4.isDone = false
        itemArray.append(newItem4)
        
        let newItem5 = Item()
        newItem5.itemTitle = "Eight"
        newItem5.isDone = false
        itemArray.append(newItem5)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let itemPopulating = itemArray[indexPath.row]
        
        cell.textLabel?.text = itemPopulating.itemTitle

//      if itemArray[indexPath.row].isDone == true {cell.accessoryType = .checkmark} else {cell.accessoryType = .none} // This code is refactored below
        
//      Ternary operator:
//      value = condition ? valueIfTrue : valueIfFalse
        
//      cell.accessoryType = itemPopulating.isDone == true ? .checkmark : .none // This is further simplified into the following:

        cell.accessoryType = itemPopulating.isDone ? .checkmark : .none

        
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(itemArray[indexPath.row])
        
        
        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone

//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//           tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark}
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
    }

    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var itemTextField = UITextField()
        
        let addItemAlert = UIAlertController(title: "Add new item", message: "Enter the item you want to add", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) in
            
            // What should happen once the user clicks 'Add' in the UIAlert
            
            let newItem = Item()
            newItem.itemTitle = itemTextField.text!
            
            self.userDefaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.itemArray.append(newItem)
            
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

